import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';
class Teams with ChangeNotifier
{
  final List<Team> _items=[];
  get getItems
  {
    return _items;
  }

  get getItemsLength
  { 
    return _items.length;
  }

  Future getTeams() async
  {
    // var response = await http.get(Uri.https('balldontlie.io','/api/v1/teams'));
    // var response = await http.get(Uri.https('football98.p.rapidapi.com','/premierleague/table'),headers: Headers.requestHeaders);
    var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/championsleague/table'),headers: Headers.requestHeaders);
    // print(response.body);
    var jsonData=jsonDecode((response.body));
    // print(jsonData);
    // print('end of json');
    for(var eachTeam in jsonData)
    {
      // print(eachTeam);
      final team=Team.fromJson(eachTeam);
      _items.add(team);
      notifyListeners();
    }
    
  }

}