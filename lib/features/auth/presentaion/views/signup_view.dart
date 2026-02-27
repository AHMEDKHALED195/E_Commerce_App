import 'package:e_commerce_app/core/services/git_it_services.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/presentaion/cubits/signup_cubit/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(gitIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: Builder(
          builder: (context) {
            return BlocConsumer<SignupCubit, SignupState>(
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is SignupLoading ? true : false,
                  child: SignupViewBody(),
                );
              },
              listener: (BuildContext context, SignupState state) {
                if (state is SignupSuccess) {
                  Navigator.pop(context);
                }
                if (state is SignupFailure) {
                  print(state.message);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
