import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.valueText,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? valueText;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF9AA1A1)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyles.semiBold13,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (valueText != null) ...[
              Text(
                valueText!,
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF9AA1A1),
                ),
              ),
              const SizedBox(width: 6),
            ],
            trailing ??
                const Icon(
                  Icons.chevron_left,
                  size: 22,
                  color: Color(0xFF9AA1A1),
                ),
          ],
        ),
      ),
    );
  }
}
