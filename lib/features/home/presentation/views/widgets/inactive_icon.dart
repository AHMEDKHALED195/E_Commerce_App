import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InactiveIcon extends StatelessWidget {
  const InactiveIcon({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
