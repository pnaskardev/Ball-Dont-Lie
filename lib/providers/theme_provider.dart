import 'package:ball_dont_lie/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier
{
  static const theme_status = "THEMESTATUS";
  late bool darkEnabled;
  late ThemeData _selectedTheme;

  ThemeProvider({required bool isDarkMode})
  {
    _selectedTheme=isDarkMode?Themes.darkTheme:Themes.lightTheme;
    darkEnabled=isDarkMode;
  }

  // ThemePrefrence themePref=ThemePrefrence();
  void swapTheme(bool value) async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    if(value==false)
    {
      _selectedTheme=Themes.lightTheme;
      darkEnabled=false;
      prefs.setBool(theme_status, false);
      notifyListeners();
    }
    else
    {
      darkEnabled=true;
      _selectedTheme=Themes.darkTheme;
      prefs.setBool(theme_status, true);
    }

    notifyListeners();
  }

  ThemeData get getTheme=>_selectedTheme;
  get getDarkEnabled=>darkEnabled;

}