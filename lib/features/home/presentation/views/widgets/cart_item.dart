import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_network_image.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart'
    show CartItemEntity;
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFF3F5F7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CustomNetworkImage(
              imageUrl: cartItemEntity.productEntity.imageUrl ?? '',
            ),
          ),
          const SizedBox(width: 19),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cartItemEntity.productEntity.name, style: TextStyles.bold16),

              Text(
                '${cartItemEntity.totalWeight} كم',
                style: TextStyles.regular13.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),

              Row(
                children: [
                  CartItemActionButtons(cartItemEntity: cartItemEntity),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.delete_sweep_outlined,
                  size: 30,
                  color: Color(0xFF949D9E),
                ),
                onPressed: () {
                  context.read<CartCubit>().removeItemFromCart(cartItemEntity);
                },
              ),
              const SizedBox(height: 16),
              Text(
                '${cartItemEntity.totalPrice} جنيه',
                style: TextStyles.bold16.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
