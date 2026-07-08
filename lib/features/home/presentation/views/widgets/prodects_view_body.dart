import 'package:e_commerce_app/core/cubits/products_cubit/product_cubit_.dart';
import 'package:e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_grid_view_block_builder.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/product_view_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
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
                  buildAppBar(context, title: "المنتجات"),
                  SizedBox(height: 16),
                  SearchTextField(),

                  SizedBox(height: 12),
                  ProductViewHeader(
                    productsLenght: context.read<ProductCubit>().productLength,
                  ),
                  SizedBox(height: 8),
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
