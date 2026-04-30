import 'package:e_commerce_app/core/helper_functions/get_user.dart';
import 'package:e_commerce_app/core/services/firbase_auth_service.dart';
import 'package:e_commerce_app/core/utiles/app_images.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/notification_widget.dart';
import 'package:e_commerce_app/features/auth/presentaion/views/login_view.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: Text(getUser().displayName, style: TextStyles.bold16),
      trailing: GestureDetector(
        child: NotificationWidget(),
        onTap: () {
          FirebaseAuthService().signOut();
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        },
      ),
    );
  }
}
