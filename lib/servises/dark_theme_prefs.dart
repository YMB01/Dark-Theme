import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  static const Theme_Key = 'key';
  setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(Theme_Key, value);
  }
  Future<bool> getDarkTheme()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(Theme_Key) ?? false;
  }
}
