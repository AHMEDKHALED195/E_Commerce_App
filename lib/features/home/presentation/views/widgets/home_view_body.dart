import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
