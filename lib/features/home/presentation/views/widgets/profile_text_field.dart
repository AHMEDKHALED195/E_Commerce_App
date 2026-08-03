import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.controller,
    this.enabled = true,
    this.validator,
  });

  final TextEditingController controller;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      textAlign: TextAlign.right,
      validator: validator,
      style: TextStyles.semiBold13.copyWith(
        color: enabled ? Colors.black : const Color(0xFF9AA1A1),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0x7FF2F3F3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        // الأيقونة عالشمال في التصميم، وده بيتحقق بـ suffixIcon مع اتجاه RTL
        suffixIcon: Icon(
          Icons.edit_outlined,
          size: 18,
          color: enabled ? const Color(0xFF616A6B) : const Color(0xFFB9BEBE),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
      ),
    );
  }
}
