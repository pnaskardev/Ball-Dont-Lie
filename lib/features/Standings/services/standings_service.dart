import 'dart:convert';

import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; 

class StandingsService
{

  Future<List<Team>> getStandings(String league) async
  {
    try 
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token') ?? '';
      prefs.setString('x-auth-token', token);
      

      var response = await http.get
      (
        Uri.parse('$uri/standings?league=$league'),
        headers: <String, String>
        {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
        }
      );
      // print(response.body);
      var jsonData=jsonDecode((response.body));
      List<Team>tempList=[];
      for(var eachTeam in jsonData)
      {
        final team=Team.fromJson(eachTeam);
        tempList.add(team);
      }  
      return tempList;
    } 
    catch (e) 
    {
      throw Exception(e);  
    }
  }

}