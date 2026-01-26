import 'package:e_commerce_app/core/helper_functions/on_generate_rout.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FruitHup',
      theme: ThemeData(primarySwatch: Colors.green),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
