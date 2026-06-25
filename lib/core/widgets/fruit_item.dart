import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
                product.imageUrl != null
                    ? Flexible(
                        child: CustomNetworkImage(imageUrl: product.imageUrl!),
                      )
                    : const SizedBox(height: 100, width: double.infinity),
                SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  title: Text(product.name, style: TextStyles.bold16),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text.rich(
                      TextSpan(
                        text: '${product.price} جنية ',
                        style: TextStyles.bold13.copyWith(
                          color: Color(0xFFF4A91F),
                        ),
                        children: [
                          TextSpan(
                            text: '/كيلو',
                            style: TextStyles.semiBold13.copyWith(
                              color: Color(0xFFF8C76D),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFF1B5E37),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
