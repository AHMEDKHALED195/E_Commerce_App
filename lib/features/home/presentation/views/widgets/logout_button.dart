import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/logout_confirmation_dialog.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFFEAF6EF),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const LogoutConfirmationDialog(),
          );
        },
        icon: const Icon(Icons.logout, color: AppColors.primaryColor, size: 18),
        label: Text(
          'تسجيل الخروج',
          style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
