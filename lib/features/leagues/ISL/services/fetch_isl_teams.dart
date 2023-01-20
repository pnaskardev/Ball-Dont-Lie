import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:http/http.dart' as http; 
class ISLService
{
  Future<List<Team>> getislTeams() async
  {
    var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'indiansuperleague/table'),headers: Headers.requestHeaders);
    // print(response.body);
    var jsonData=jsonDecode((response.body));
    // print(jsonData);
    List<Team> _tempItem=[];
    for(var eachTeam in jsonData)
    {
      final team=Team.fromJson(eachTeam);
      _tempItem.add(team);
    } 
    return _tempItem;
  }
}