import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../image_cubit/images_cubit.dart';
import 'search_image_view_widget.dart';

class InfoSearchWidget extends StatelessWidget {
  final String searchWord;
  const InfoSearchWidget({super.key, required this.searchWord});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ImagesCubit>(context).getImages(query: searchWord);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
      leading: 
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
          Navigator.pop(context);
          },
      ),
        backgroundColor: Colors.black,
        title: Text(
          searchWord,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ImagesViewWidget(description: searchWord),
    );
  }
}
