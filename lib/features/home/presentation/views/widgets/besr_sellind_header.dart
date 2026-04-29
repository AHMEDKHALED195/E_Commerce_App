import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('االأكثر مبيعًا', style: TextStyles.bold16),
          Spacer(),
          Text(
            'المزيد',
            style: TextStyles.regular13.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
