import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_bottun.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/profile_details_cubit/profile_details_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_password_field.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_section_label.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDetailsViewBody extends StatefulWidget {
  const ProfileDetailsViewBody({super.key});

  @override
  State<ProfileDetailsViewBody> createState() => _ProfileDetailsViewBodyState();
}

class _ProfileDetailsViewBodyState extends State<ProfileDetailsViewBody> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var user = context.read<ProfileDetailsCubit>().getCachedUserData();
    nameController = TextEditingController(text: user.displayName);
    emailController = TextEditingController(text: user.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const ProfileSectionLabel(text: 'المعلومات الشخصيه'),
              ProfileTextField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'الرجاء إدخال الاسم';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ProfileTextField(controller: emailController, enabled: false),
              const SizedBox(height: 20),
              const ProfileSectionLabel(text: 'تغيير كلمة المرور'),
              ProfilePasswordField(
                controller: currentPasswordController,
                hintText: 'كلمة المرور الحالي',
                validator: _passwordFieldsValidator,
              ),
              const SizedBox(height: 12),
              ProfilePasswordField(
                controller: newPasswordController,
                hintText: 'كلمة المرور الجديده',
                validator: (value) {
                  var baseError = _passwordFieldsValidator(value);
                  if (baseError != null) return baseError;
                  if (value != null && value.isNotEmpty && value.length < 6) {
                    return 'لازم تكون 6 حروف على الأقل';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ProfilePasswordField(
                controller: confirmPasswordController,
                hintText: 'تأكيد كلمة المرور الجديده',
                validator: (value) {
                  var baseError = _passwordFieldsValidator(value);
                  if (baseError != null) return baseError;
                  if (value != newPasswordController.text) {
                    return 'كلمة المرور غير متطابقة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              CustomBottun(onPressed: _onSavePressed, text: 'حفظ التغييرات'),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // لو المستخدم بدأ يدخل بيانات في أي حقل من حقول كلمة المرور،
  // لازم باقي الحقول تتملى برضو (كلهم أو ولا واحد فيهم)
  String? _passwordFieldsValidator(String? value) {
    var anyPasswordFieldFilled =
        currentPasswordController.text.isNotEmpty ||
        newPasswordController.text.isNotEmpty ||
        confirmPasswordController.text.isNotEmpty;

    if (anyPasswordFieldFilled && (value == null || value.isEmpty)) {
      return 'مطلوب لتغيير كلمة المرور';
    }
    return null;
  }

  void _onSavePressed() {
    if (!formKey.currentState!.validate()) return;

    context.read<ProfileDetailsCubit>().saveChanges(
      newName: nameController.text.trim(),
      currentPassword: currentPasswordController.text.isEmpty
          ? null
          : currentPasswordController.text,
      newPassword: newPasswordController.text.isEmpty
          ? null
          : newPasswordController.text,
    );
  }
}
