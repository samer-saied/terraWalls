import 'package:flutter/material.dart';
import 'package:terrawalls/utils/format_date.dart';

import '../../models/photo_model.dart';

class IntroductionView extends StatelessWidget {
  final UnsplashPhoto image;
  const IntroductionView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(image.urls.regular),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withValues(alpha: 0.1),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              image.slug.split('-').join(" ").toUpperCase(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 24,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            Text(
              image.description.toString(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),

            Text(
              formatHumanReadableDate(image.createdAt.toString()),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
