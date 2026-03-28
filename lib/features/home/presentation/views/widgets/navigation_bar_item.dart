import 'package:e_commerce_app/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/active_icon.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/inactive_icon.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isActive,
    required this.bottomNavigationBarEntity,
  });
  final bool isActive;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveIcon(
            icon: bottomNavigationBarEntity.activeIcon,
            title: bottomNavigationBarEntity.title,
          )
        : InactiveIcon(icon: bottomNavigationBarEntity.inactiveIcon);
  }
}
