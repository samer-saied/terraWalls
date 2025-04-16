
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../image_cubit/images_cubit.dart';
import '../../home/widgets/main_image_screen.dart';

class ImagesViewWidget extends StatelessWidget {
  final String description;
  const ImagesViewWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesCubit, ImagesState>(
      buildWhen:
          (previous, current) =>
              current is! ImagesLoading, // Skip loading states
      builder: (context, state) {
        if (state is ImagesLoadError) {
          return Center(child: Text(state.message));
        } else if (state is ImagesLoaded) {
          return LoadedImagesWidget(
            description: description,
            images: state.images,
          );
        }
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      },
    );
  }
}
