import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/features/auth/presentaion/views/signup_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'ليس لديك حساب؟ ',
        style: TextStyles.regular16.copyWith(color: Color(0xFF616A6B)),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(
                  context,
                  SignupView.routeName,
                ); // Navigate to signup view
              },
            text: 'إنشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor, // Color(0xFF949D9E ),
            ),
          ),
        ],
      ),
    );
  }
}
