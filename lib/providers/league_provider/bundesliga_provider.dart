import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:http/http.dart' as http; 
import 'package:flutter/cupertino.dart';

class BundesLigaTeams with ChangeNotifier
{
  final List<Team> _bundesLigaTeams=[];

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

  // Future getbundesLigaTeams(int index) async
  // {
  //   var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/${indexLeagueHeaders[index]}/table'),headers: Headers.requestHeaders);
  //   // print(response.body);
  //   var jsonData=jsonDecode((response.body));
  //   // print(jsonData);
  //   for(var eachTeam in jsonData)
  //   {
  //     final team=Team.fromJson(eachTeam);
  //     addbundesLigaTeam(team);
  //   }
    
  // }


}