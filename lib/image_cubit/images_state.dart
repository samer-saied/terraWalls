part of 'images_cubit.dart';
sealed class ImagesState {}

final class ImagesLoading extends ImagesState {}

final class ImagesLoaded extends ImagesState {
  final List<UnsplashPhoto> images;

  ImagesLoaded({required this.images});
}

final class ImagesLoadError extends ImagesState {
  final String message;

  ImagesLoadError({required this.message});
}
