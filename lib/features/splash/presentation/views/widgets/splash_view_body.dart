import 'package:e_commerce_app/core/services/firbase_auth_service.dart';
import 'package:e_commerce_app/core/services/firestore_service.dart';
import 'package:e_commerce_app/core/services/shared_prefrences_singelton.dart';
import 'package:e_commerce_app/core/utiles/app_images.dart';
import 'package:e_commerce_app/features/auth/presentaion/views/login_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentaion/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),

        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashButtom, fit: BoxFit.fill),
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool('kIsOnBoardingViewSeen');
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        bool isLoggedIn = FirebaseAuthService().isUserLoggedIn();
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
