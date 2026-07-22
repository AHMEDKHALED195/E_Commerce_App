import 'package:e_commerce_app/core/widgets/custom_bottun.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomBottun(
          onPressed: () {
            Navigator.pushNamed(
              context,
              CheckoutView.routeName,
              arguments: context.read<CartCubit>().cartEntity,
            );
          },
          text:
              'الدفع ${context.watch<CartCubit>().cartEntity.totalPrice} جنية',
        );
      },
    );
  }
}
