import 'package:ball_dont_lie/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier
{
  ThemePrefrence themePref=ThemePrefrence();
  bool _darkTheme=false;

  bool get darkTheme
  {
    return _darkTheme;
  }

  set darkTheme(bool value)
  {
    _darkTheme=value;
    themePref.setDarkTheme(value);
    notifyListeners();
  }

}