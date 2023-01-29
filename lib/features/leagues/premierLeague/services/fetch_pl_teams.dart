import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/team.dart';

class PLService
{
  Future<List<Team>> getPLteams() async
  {
    

    try 
    {
      var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/premierleague/table'),headers: Headers.requestHeaders);
      var jsonData=jsonDecode((response.body));
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