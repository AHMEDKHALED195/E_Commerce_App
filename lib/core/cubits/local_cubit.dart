import 'package:e_commerce_app/core/services/shared_prefrences_singelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String kLocaleCodeKey = 'localeCode';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(_getInitialLocale());

  static Locale _getInitialLocale() {
    var savedCode = Prefs.getString(kLocaleCodeKey);
    if (savedCode.isEmpty) return const Locale('ar');
    return Locale(savedCode);
  }

  void changeLocale(Locale locale) {
    Prefs.setString(kLocaleCodeKey, locale.languageCode);
    emit(locale);
  }
}
