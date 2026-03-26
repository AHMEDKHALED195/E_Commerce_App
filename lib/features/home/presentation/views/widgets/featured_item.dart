import 'package:e_commerce_app/core/utiles/app_images.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final itemWidth = size.width - 32;

    final scale = itemWidth / 342;

    final paddingRight = (33 * scale).clamp(12.0, 48.0);
    final topSpacing = (25 * scale).clamp(10.0, 36.0);
    final midSpacing = (11 * scale).clamp(6.0, 16.0);
    final bottomSpacing = (29 * scale).clamp(12.0, 40.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: itemWidth * .4,
                child: SvgPicture.asset(
                  Assets.imagesPageViewItem2Image,
                  fit: BoxFit.fill,
                ),
              ),

              SizedBox(
                width: itemWidth * .5,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: svg.Svg(Assets.imagesFeaturedItemBackground),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: paddingRight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: topSpacing),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'عروض العيد',
                            style: TextStyles.regular13.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: midSpacing),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'خصم 25%',
                            style: TextStyles.bold19.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: midSpacing),
                        FeaturedItemButton(onPressed: () {}),
                        SizedBox(height: bottomSpacing),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
