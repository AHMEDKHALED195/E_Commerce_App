import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_network_image.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    //     (image)  apple      delete
    //             countaty    60
    //                 + 3 -
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
              imageUrl:
                  'https://images.unsplash.com/photo-1713959925337-3a79df64fccd?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YXBwbGUlMjBmcnVpdHxlbnwwfHwwfHx8MA%3D%3Dhttps://unsplash.com/s/photos/apple-fruit',
            ),
          ),
          const SizedBox(width: 19),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('تفاح', style: TextStyles.bold16),

              Text(
                '3 كم',
                style: TextStyles.regular13.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),

              Row(children: [CartItemActionButtons()]),
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
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              Text(
                '60 جنيه',
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
