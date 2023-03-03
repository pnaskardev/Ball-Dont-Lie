import 'package:flutter/material.dart';

class FavProvider with ChangeNotifier
{
  String? favLeague;
  get getFav=>favLeague;
  void setFav(String l)
  {
    favLeague=l;
    notifyListeners();
  }
}