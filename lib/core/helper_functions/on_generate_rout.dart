import 'package:e_commerce_app/features/auth/presentaion/views/login_view.dart';
import 'package:e_commerce_app/features/auth/presentaion/views/signup_view.dart';
import 'package:e_commerce_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/profile_details_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentaion/views/on_boarding_view.dart';
import 'package:e_commerce_app/features/orders/presentaion/views/my_orders_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // You can add your route handling logic here
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    case ProfileDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileDetailsView());
    case MyOrdersView.routeName:
      return MaterialPageRoute(builder: (_) => const MyOrdersView());
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder: (_) =>
            CheckoutView(cartEntity: settings.arguments as CartEntity),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('No route defined for this path')),
        ),
      );
  }
}
