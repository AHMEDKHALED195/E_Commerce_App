import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/utiles/app_images.dart';
import 'package:e_commerce_app/core/utiles/app_text_styles.dart';
import 'package:e_commerce_app/features/on_boarding/presentaion/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isvisible: true,
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك في ',
                textAlign: TextAlign.center,
                style: TextStyles.bold23,
              ),
              Text(
                ' HUB',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text('Fruit', style: TextStyles.bold23),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        // items duplicated for testing purpose
        PageViewItem(
          isvisible: false,
          image: Assets.imagesPageViewItem2Image,
          backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: TextStyles.bold23,
          ),
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
