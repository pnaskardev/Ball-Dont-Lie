import 'package:flutter/material.dart';

class LeagueProvider with ChangeNotifier
{
  List<String> selectedLeagues=[];

  get getList=>selectedLeagues;

  void addLeague(String l)
  {
    selectedLeagues.add(l);
    notifyListeners();
  }

  void deleteLeague(String l)
  {
    selectedLeagues.remove(l);
    notifyListeners();
  }

}