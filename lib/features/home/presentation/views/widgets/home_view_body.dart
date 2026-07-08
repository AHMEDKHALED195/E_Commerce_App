import 'package:e_commerce_app/core/cubits/products_cubit/product_cubit_.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/besr_sellind_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_grid_view_block_builder.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
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
            sliver: ProductsGridViewBlockBuilder(),
          ),
        ],
      ),
    );
  }
}
