import 'package:e_commerce_app/core/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      obscureText: isObscure,
      onSaved: widget.onSaved,
      icon: GestureDetector(
        onTap: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        child: isObscure
            ? Icon(Icons.visibility_off, color: Color(0xffC9CECF))
            : Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
      ),
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
