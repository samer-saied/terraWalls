import 'package:flutter/material.dart';

class CircularLoadingWithIcon extends StatelessWidget {
  final double size;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;
  final void Function()? onTap;
  final double? value; // null for indeterminate, 0-1 for determinate progress

  const CircularLoadingWithIcon({
    super.key,
    this.size = 64.0,
    this.icon = Icons.download,
    this.iconSize = 24.0,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.progressColor = Colors.white,
    this.strokeWidth = 4.0,
    this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Circular progress indicator (background)
            CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor.withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              strokeWidth: strokeWidth,
            ),

            // Icon container
            Container(
              width: size - strokeWidth * 4,
              height: size - strokeWidth * 4,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: iconSize, color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
