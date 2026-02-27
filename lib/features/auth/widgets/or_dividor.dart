import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE), thickness: 2)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('أو', style: TextStyles.semiBold16),
        ),
        Expanded(child: Divider(color: Color(0xFFDCDEDE), thickness: 2)),
      ],
    );
  }
}
