import 'package:e_commerce_app/core/services/git_it_services.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/presentaion/cubits/signin_cubit/signin_cubit.dart';
import 'package:e_commerce_app/features/auth/widgets/signin_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(gitIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول'),
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
