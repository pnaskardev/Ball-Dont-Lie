import 'dart:convert';

import 'package:ball_dont_lie/models/league.dart';
import 'package:flutter/foundation.dart';

class User {
  final String id;
  String name;
  final String email;
  final String password;
  final String token;
  final List<League> selectedLeagues;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.token,
    required this.selectedLeagues,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    List<dynamic> leaguesJson = json['selectedLeagues'];
    List<League> leagues = leaguesJson
        .map((leagueJson) => League.fromJson(leagueJson))
        .toList();

    return User
    (
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
      selectedLeagues: leagues,
    );
  }

  Map<String, dynamic> toJson() 
  {
    List<Map<String, dynamic>> leaguesJson =selectedLeagues.map((league) => league.toJson()).toList();

    return 
    {
      '_id': id,
      name:'name',
      'email': email,
      'password': password,
      'token': token,
      'selectedLeagues': leaguesJson,
    };
  }

  factory User.fromString(String jsonString) 
  {
    final Map<String, dynamic> map = json.decode(jsonString);
    return User.fromJson(map);
  }

  
}