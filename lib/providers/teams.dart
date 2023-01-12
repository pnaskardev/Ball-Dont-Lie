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
    var response = await http.get(Uri.https('balldontlie.io','/api/v1/teams'));
    // print(response.body);
    var jsonData=jsonDecode((response.body));

    for(var eachTeam in jsonData['data'])
    {
      final team=Team.fromSnap(eachTeam);
      _items.add(team);
    }
    // print(_items.length);
  }

}