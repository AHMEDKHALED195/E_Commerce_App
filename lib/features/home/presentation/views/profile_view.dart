import 'package:e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حسابي', showNotificationIcon: false),
      body: const ProfileViewBody(),
    );
  }
}
