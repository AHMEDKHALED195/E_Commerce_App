import 'package:e_commerce_app/core/cubits/local_cubit.dart';
import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagePickerDialog extends StatelessWidget {
  const LanguagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var currentLocale = context.watch<LocaleCubit>().state;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageOption(
              label: 'العربية',
              isSelected: currentLocale.languageCode == 'ar',
              onTap: () {
                context.read<LocaleCubit>().changeLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
            const Divider(height: 1, color: Color(0xFFEDEEEE)),
            _LanguageOption(
              label: 'English',
              isSelected: currentLocale.languageCode == 'en',
              onTap: () {
                context.read<LocaleCubit>().changeLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected
                  ? AppColors.primaryColor
                  : const Color(0xFF9AA1A1),
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(label, style: TextStyles.semiBold16),
          ],
        ),
      ),
    );
  }
}
