import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_bottun.dart';
import 'package:e_commerce_app/core/widgets/custom_form_text_field.dart';
import 'package:e_commerce_app/features/auth/widgets/have_account.dart';
import 'package:e_commerce_app/features/auth/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomFormTextField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 16),
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
            TermsAndCondition(),
            SizedBox(height: 32),
            CustomBottun(onPressed: () {}, text: 'إنشاء حساب جديد'),
            SizedBox(height: 32),
            HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
