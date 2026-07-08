import 'package:e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_bottun.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/car_items_list.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

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
              SliverToBoxAdapter(child: const CustomDivider()),
              const CarItemsList(),
              SliverToBoxAdapter(child: const CustomDivider()),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.sizeOf(context).height * 0.02,
            child: CustomBottun(onPressed: () {}, text: 'الدفع 120 جنية'),
          ),
        ],
      ),
    );
  }
}
