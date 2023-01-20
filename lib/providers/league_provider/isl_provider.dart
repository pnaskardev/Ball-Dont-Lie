import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:http/http.dart' as http; 
import 'package:flutter/cupertino.dart';

class ISlTeams with ChangeNotifier
{
  final List<Team> _islTeams=[];

  get getTeams
  {
    return _islTeams;
  }

  get getItemsLength
  { 
    return _islTeams.length;
  }

  void addislTeam(Team team)
  {
    _islTeams.add(team);
    notifyListeners();
  }

  // Future getislTeams(int index) async
  // {
  //   var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/${indexLeagueHeaders[index]}/table'),headers: Headers.requestHeaders);
  //   // print(response.body);
  //   var jsonData=jsonDecode((response.body));
  //   // print(jsonData);
  //   for(var eachTeam in jsonData)
  //   {
  //     final team=Team.fromJson(eachTeam);
  //     addislTeam(team);
  //   }
    
  // }


}