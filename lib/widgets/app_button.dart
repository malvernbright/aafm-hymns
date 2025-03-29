

import 'package:aafm_hymns/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.onTap,
    this.color = AppColors.white,
    this.backgroundColor = AppColors.blue,
    this.borderRadius = 5,
    this.verticalPadding = 7,
    super.key,
  });

  final String text;
  final VoidCallback? onTap;
  final Color color;
  final Color backgroundColor;
  final double borderRadius;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
                vertical: sy(verticalPadding),
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                  fontSize: sy(10),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
