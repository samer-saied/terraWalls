import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:terrawalls/models/photo_model.dart';
import 'package:http/http.dart' as http;

import '../data/urls.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesLoading());

  List<UnsplashPhoto> data = [];
  int index = 1;

  void getImages({String? query}) async {
    try {
      emit(ImagesLoading());
      data = await getImagesData(query, index);
      emit(ImagesLoaded(images: data));
    } catch (e) {
      emit(ImagesLoadError(message: e.toString()));
    }
  }

  Future<void> loadMoreImages({required String query}) async {
    try {
      List<UnsplashPhoto> newData = await getImagesData(query, ++index);
      data.addAll(newData);
      emit(ImagesLoaded(images: data));
    } catch (e) {
      emit(ImagesLoadError(message: e.toString()));
    }
  }

  Future<List<UnsplashPhoto>> getImagesData(String? query, int pageNo) async {
    List<UnsplashPhoto> images = [];
    try {
      List<dynamic> data = await fetchData(query, pageNo);
      for (var image in data) {
        images.add(UnsplashPhoto.fromJson(image));
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return images;
  }
}

Future<List<dynamic>> fetchData(String? query, int index) async {
  String url = AppUrls.getFullUrl(query: query, pageNo: index);
  http.Response response = await http.get(Uri.parse(url));

  try {
    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      return query == null ? data['images'] : data['results'];
    } else {
      return [
        {'error': 'Failed to load data', 'code': "No Response"},
      ];
    }
  } catch (e) {
    return [
      {'error': 'Failed to load data', 'code': e.toString()},
    ];
  }
}
