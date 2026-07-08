import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_images.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key, required this.productsLenght});
  final int productsLenght;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$productsLenght نتائج', style: TextStyles.bold16),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SvgPicture.asset(Assets.imagesFilter2),
        ),
      ],
    );
  }
}
