import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:http/http.dart' as http; 
import 'package:flutter/cupertino.dart';

class PremierLeagueTeams with ChangeNotifier
{
  final List<Team> _plTeams=[];

  get getteams
  {
    return _plTeams;
  }

  get getPLteamsLength
  { 
    return _plTeams.length;
  }

  void addPlteam(Team team)
  {
    _plTeams.add(team);
    notifyListeners();
  }

  Future getPLteams(int index) async
  {
    var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/${indexLeagueHeaders[index]}/table'),headers: Headers.requestHeaders);
    // print(response.body);
    var jsonData=jsonDecode((response.body));
    // print(jsonData);
    for(var eachTeam in jsonData)
    {
      final team=Team.fromJson(eachTeam);
      addPlteam(team);
    }
    
  }


}