import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_bottun.dart';
import 'package:e_commerce_app/core/widgets/custom_form_text_field.dart';
import 'package:e_commerce_app/features/auth/presentaion/cubits/signup_cubit/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/widgets/have_account.dart';
import 'package:e_commerce_app/features/auth/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String email = '';
  String password = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomFormTextField(
                onSaved: (value) => name = value!,
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomFormTextField(
                onSaved: (value) => email = value!,
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomFormTextField(
                onSaved: (value) => password = value!,
                icon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16),
              TermsAndCondition(),
              SizedBox(height: 32),
              CustomBottun(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                      email,
                      password,
                      name,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              SizedBox(height: 32),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
