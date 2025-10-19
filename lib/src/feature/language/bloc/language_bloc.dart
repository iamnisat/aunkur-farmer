import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  static const String selectedLanguageKey = 'selectedLanguage';

  LanguageBloc() : super(const LanguageState(locale: Locale('en'))) {
    _loadSavedLanguage();

    on<ChangeLanguage>((event, emit) async {
      emit(LanguageState(locale: event.locale));
      await _saveLanguage(event.locale);
    });
  }

  // Load saved language from SharedPreferences
  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString(selectedLanguageKey);

    if (languageCode != null) {
      add(ChangeLanguage(Locale(languageCode)));
    }
  }

  // Save the selected language to SharedPreferences
  Future<void> _saveLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(selectedLanguageKey, locale.languageCode);
  }
}