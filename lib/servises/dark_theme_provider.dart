import 'package:flutter/cupertino.dart';
import 'package:theme/servises/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs provider = DarkThemePrefs();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;
  set setDarkTheme(bool value) {
    _darkTheme = value;
    provider.setDarkTheme(value);
    notifyListeners();
  }
}
