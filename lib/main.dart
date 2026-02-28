import 'package:e_commerce_app/core/helper_functions/on_generate_rout.dart';
import 'package:e_commerce_app/core/services/custom_bloc_observe.dart';
import 'package:e_commerce_app/core/services/git_it_services.dart';
import 'package:e_commerce_app/core/services/shared_prefrences_singelton.dart';
import 'package:e_commerce_app/core/utiles/app_colors.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  setup();
  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      title: 'FruitHup',
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
