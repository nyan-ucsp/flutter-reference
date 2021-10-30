import 'package:flutter_reference/services/theme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'encryption_service.dart';

final _prefs = SharedPreferences.getInstance();

class SharedPreferencesService {
  static final String credentialKey = EncryptionService.encrypt(
    text: 'credential',
  );
  static Future<String> checkThemeMode() async {
    final SharedPreferences prefs = await _prefs;
    final String? themeMode = prefs.get('theme_mode') as String?;
    return themeMode ?? ThemeService.defaultThemeValue;
  }

  static Future<void> setDarkMode() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('theme_mode', ThemeService.darkThemeValue);
  }

  static Future<void> setPrimaryMode() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('theme_mode', ThemeService.lightThemeValue);
  }

  static Future<void> setSystemDefaultMode() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('theme_mode');
  }
}
