import 'package:e_commerce_app/features/home/presentation/views/widgets/besr_sellind_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: BestSellingGridView(),
        ),
      ],
    );
  }
}
