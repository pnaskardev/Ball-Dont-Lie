import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/features/leagues/bundesliga/services/fetch_bundesliga_teams.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:http/http.dart' as http; 
import 'package:flutter/cupertino.dart';

class BundesLigaTeams with ChangeNotifier
{
  List<Team> _bundesLigaTeams=[];
  bool isLoading=false;

  final _service=BundesligaService();
  get getTeams
  {
    return _bundesLigaTeams;
  }

  get getItemsLength
  { 
    return _bundesLigaTeams.length;
  }

  void addbundesLigaTeam(Team team)
  {
    _bundesLigaTeams.add(team);
    notifyListeners();
  }

  Future<void> getbundesLigaTeams() async
  {
    isLoading=true;
    notifyListeners();

    final response= await _service.getbundesLigaTeams();
    
    _bundesLigaTeams=response;
    isLoading=false;
    notifyListeners();
  }


}