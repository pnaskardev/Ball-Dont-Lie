// ignore_for_file: unnecessary_this

import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;
  String? token;
  final List<String> selectedLeagues;

  User({
    required this.id,
    required this.email,
    required this.password,
    this.token,
    required this.selectedLeagues,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'] ?? '',
        email: json['email'] ?? '',
        password: json['password'] ?? '',
        selectedLeagues: json['selectedLeagues'].cast<String>() ?? []);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['token'] = this.token;
    data['selectedLeagues'] = this.selectedLeagues;
    return data;
  }

  factory User.fromString(String jsonString) {
    final Map<String, dynamic> map = json.decode(jsonString);
    return User.fromJson(map);
  }
}
