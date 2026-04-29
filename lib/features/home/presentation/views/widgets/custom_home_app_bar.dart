import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/profile_image.png'),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: Color(0xFF949D9E)),
      ),
      subtitle: Text('محمد علي', style: TextStyles.bold16),
      trailing: NotificationWidget(),
    );
  }
}
