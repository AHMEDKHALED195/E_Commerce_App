import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_images.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_bottun.dart';
import 'package:e_commerce_app/core/widgets/custom_form_text_field.dart';
import 'package:e_commerce_app/features/auth/widgets/or_dividor.dart';
import 'package:e_commerce_app/features/auth/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/features/auth/widgets/dont_have_an_account_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomFormTextField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomFormTextField(
              icon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمةالمرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            CustomBottun(onPressed: () {}, text: 'تسجيل دخول'),
            SizedBox(height: 32),
            const DontHaveAnAccountWidget(),
            SizedBox(height: 33),
            const OrDivider(),
            SizedBox(height: 40),
            SocialLoginButton(
              title: 'تسجيل بواسطة جوجل',
              iconPath: Assets.imagesGoogleIcons,
              onPressed: () {},
            ),
            SizedBox(height: 20),
            SocialLoginButton(
              title: 'تسجيل بواسطة أبل',
              iconPath: Assets.imagesAppleIcon,
              onPressed: () {},
            ),
            SizedBox(height: 20),
            SocialLoginButton(
              title: 'تسجيل بواسطة فيسبوك',
              iconPath: Assets.imagesFacebookIcon,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
