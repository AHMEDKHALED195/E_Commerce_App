import 'package:e_commerce_app/core/services/git_it_services.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/profile_details_cubit/profile_details_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_details_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});
  static const String routeName = 'profileDetails';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileDetailsCubit(gitIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الملف الشخصي'),
        body: const ProfileDetailsViewBlocConsumer(),
      ),
    );
  }
}