import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final scale = (screenWidth / 375).clamp(0.75, 1.4);

    final buttonHeight = (32 * scale).clamp(24.0, 44.0);
    final horizontalPadding = (24 * scale).clamp(12.0, 36.0);

    return SizedBox(
      height: buttonHeight,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        ),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'تسوق الان',
            style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
