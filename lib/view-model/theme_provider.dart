import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences prefs;
  bool _isDark = false;

  get isDark => _isDark;
  get themMode {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeProvider() {
    _isDark = true;
    loadFromPrefs();
  }

  loadFromPrefs() async {
    await _initPrefs();
    _isDark = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  switchTheme() {
    _isDark = !_isDark;
    saveToPrefs();
    notifyListeners();
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _isDark);
  }
}
