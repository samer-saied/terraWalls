
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../image_cubit/images_cubit.dart';
import '../../../models/photo_model.dart';
import '../../details/details_screen.dart';
import '../../components/introduction_view_widgets.dart';

class LoadedImagesWidget extends StatefulWidget {
  final String description;
  final List<UnsplashPhoto> images;
  const LoadedImagesWidget({
    super.key,
    required this.images,
    required this.description,
  });

  @override
  State<LoadedImagesWidget> createState() => _LoadedImagesWidgetState();
}

class _LoadedImagesWidgetState extends State<LoadedImagesWidget> {
  final PageController pageController = PageController(viewportFraction: 0.9);

  bool isLoading = false;

  void _scrollListener() {
    final maxScroll = pageController.position.maxScrollExtent;
    final currentScroll = pageController.position.pixels;
    final threshold = 3 * MediaQuery.of(context).size.width;

    if (maxScroll - currentScroll <= threshold && !isLoading) {
      isLoading = true;
      context
          .read<ImagesCubit>()
          .loadMoreImages(query: widget.description)
          .then((val) {
            isLoading = false;
          });
    }
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: widget.images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailsScreen(image: widget.images[index]),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IntroductionView(image: widget.images[index]),
          ),
        );
      },
    );
  }
}
