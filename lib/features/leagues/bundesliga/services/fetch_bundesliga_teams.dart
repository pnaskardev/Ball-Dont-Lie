import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:http/http.dart' as http; 
class BundesligaService
{
  Future<List<Team>> getbundesLigaTeams() async
  {
    try 
    {
      var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/bundesliga/table'),headers: Headers.requestHeaders);
      // print(response.body);
      var jsonData=jsonDecode((response.body));
      // print(jsonData);
      List<Team> _tempList=[];
      for(var eachTeam in jsonData)
      {
        final team=Team.fromJson(eachTeam);
        _tempList.add(team);
      }
      return _tempList;  
    } catch (e) 
    {
      throw Exception(e);  
    }
  }
}