import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../utils/cache_helper.dart';
import '../utils/constats.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale("en")));

  Future<void> getSaveLanguage() async {
    final String cachedLanguageCode =
        CacheHelper.getData(key: "LOCALE").toString();

    lang = cachedLanguageCode ?? "en";
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode ?? "en")));
  }

  Future<void> changeLanguage(String languageCode) async {
    await CacheHelper.setString(key: "LOCALE", value: languageCode);
    lang = languageCode;
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
