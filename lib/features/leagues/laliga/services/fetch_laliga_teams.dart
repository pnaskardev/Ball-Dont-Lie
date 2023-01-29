import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/team.dart';

class LaligaService
{
  Future<List<Team>> getLaligaTeams() async
  {
    
    try 
    {
      var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/laliga/table'),headers: Headers.requestHeaders);
      // print(response.body);
      var jsonData=jsonDecode((response.body));
      List<Team>tempList=[];
      for(var eachTeam in jsonData)
      {
        final team=Team.fromJson(eachTeam);
        tempList.add(team);
      }  
      return tempList;
    } catch (e) 
    {
      throw Exception(e);  
    }

   
  }
}