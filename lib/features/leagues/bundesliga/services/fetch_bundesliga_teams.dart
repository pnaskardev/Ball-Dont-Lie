import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/providers/league_provider/bundesliga_provider.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:http/http.dart' as http; 
class FetchBundesligaTeams
{
  Future getbundesLigaTeams(int index) async
  {
    var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/${indexLeagueHeaders[index]}/table'),headers: Headers.requestHeaders);
    // print(response.body);
    var jsonData=jsonDecode((response.body));
    // print(jsonData);
    for(var eachTeam in jsonData)
    {
      final team=Team.fromJson(eachTeam);
      BundesLigaTeams().addbundesLigaTeam(team);
    }
    
  }
}