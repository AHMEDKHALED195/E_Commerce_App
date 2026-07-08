import 'package:e_commerce_app/core/cubits/products_cubit/product_cubit_.dart';
import 'package:e_commerce_app/core/helper_functions/get_dummy_product.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlockBuilder extends StatelessWidget {
  const ProductsGridViewBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return ProductsGridView(products: state.products);
        } else if (state is ProductError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts(6)),
          );
        }
      },
    );
  }
}
