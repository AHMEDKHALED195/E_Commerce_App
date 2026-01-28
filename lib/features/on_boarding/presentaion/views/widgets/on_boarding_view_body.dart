import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/core/services/shared_prefrences_singelton.dart';
import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_bottun.dart';
import 'package:e_commerce_app/features/auth/presentaion/views/login_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentaion/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentIndex == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.5),
          ),
        ),
        SizedBox(height: 29),
        Visibility(
          visible: currentIndex == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: CustomBottun(
              onPressed: () {
                Prefs.setBool('kIsOnBoardingViewSeen', true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              text: 'ابدأ الآن',
            ),
          ),
        ),
        SizedBox(height: 29),
      ],
    );
  }
}
