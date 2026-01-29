import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.icon,
  });
  final String hintText;
  final TextInputType keyboardType;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        hintStyle: TextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        border: buildBoarder(),
        suffixIcon: icon,
      ),
    );
  }

  OutlineInputBorder buildBoarder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: Color(0xFFE6E9E9)),
    );
  }
}
