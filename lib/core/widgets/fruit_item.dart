import 'package:e_commerce_app/core/utiles/app_images.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

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
                Image.asset(Assets.imagesWatermelonTest),
                SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  title: Text('بطيخ', style: TextStyles.bold16),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text.rich(
                      textAlign: TextAlign.right,

                      TextSpan(
                        text: '30جنية ',
                        style: TextStyles.bold13.copyWith(
                          color: Color(0xFFF4A91F),
                        ),
                        children: [
                          TextSpan(
                            text: '/ الكيلو',
                            style: TextStyles.semiBold13.copyWith(
                              color: Color(0xFFF8C76D),
                            ),
                          ),
                        ],
                      ),
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
