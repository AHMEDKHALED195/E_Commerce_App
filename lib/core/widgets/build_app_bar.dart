import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,

    title: Text(title, textAlign: TextAlign.center, style: TextStyles.bold19),
  );
}
