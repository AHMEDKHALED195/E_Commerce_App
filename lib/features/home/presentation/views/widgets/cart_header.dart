import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: Color(0xFFEBF9F1)),

      child: Center(
        child: Text(
          "لديك 3 منتجات في سلة التسوق ",
          style: TextStyles.bold13.copyWith(color: AppColors.lightPrimaryColor),
        ),
      ),
    );
  }
}
