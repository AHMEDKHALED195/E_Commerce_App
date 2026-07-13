import 'package:e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_bottun.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/car_items_list.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      buildAppBar(
                        context,
                        title: "السلة",
                        showNotificationIcon: false,
                      ),
                      const SizedBox(height: 16),
                      const CartHeader(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: context.read<CartCubit>().cartEntity.items.isEmpty
                    ? const SizedBox.shrink()
                    : const CustomDivider(),
              ),
              CarItemsList(
                cartItems: context.read<CartCubit>().cartEntity.items,
              ),
              SliverToBoxAdapter(
                child: context.read<CartCubit>().cartEntity.items.isEmpty
                    ? const SizedBox.shrink()
                    : const CustomDivider(),
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.sizeOf(context).height * 0.02,
            child: CustomBottun(
              onPressed: () {},
              text:
                  'الدفع ${context.watch<CartCubit>().cartEntity.totalPrice} جنية',
            ),
          ),
        ],
      ),
    );
  }
}
