import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_bottun.dart';
import 'package:e_commerce_app/features/on_boarding/presentaion/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor.withValues(alpha: 0.5),
          ),
        ),
        SizedBox(height: 29),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: CustomBottun(onPressed: () {}, text: 'ابدأ الآن'),
        ),
        SizedBox(height: 29),
      ],
    );
  }
}
