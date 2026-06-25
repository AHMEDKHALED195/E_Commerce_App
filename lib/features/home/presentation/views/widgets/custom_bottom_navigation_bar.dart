import 'package:e_commerce_app/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...bottomNavigationBarItems.asMap().entries.map(
            (entry) => GestureDetector(
              onTap: () => onItemTapped(entry.key),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: FadeTransition(opacity: animation, child: child),
                ),
                child: NavigationBarItem(
                  key: ValueKey(currentIndex == entry.key),
                  isActive: currentIndex == entry.key,
                  bottomNavigationBarEntity: entry.value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
