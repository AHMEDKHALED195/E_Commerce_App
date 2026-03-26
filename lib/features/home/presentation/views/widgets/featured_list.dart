import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final itemSpacing = (screenWidth * 0.023).clamp(6.0, 16.0);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      padding: EdgeInsets.symmetric(horizontal: itemSpacing),
      child: Row(
        children: List.generate(4, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: itemSpacing / 2),
            child: const FeaturedItem(),
          );
        }),
      ),
    );
  }
}
