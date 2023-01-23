import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/results.dart';
import 'package:http/http.dart' as http; 
class ResultService
{
  Future<void> getResults() async
  {
    List<Results>tempList=[];
    var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/laliga/results'),headers: Headers.requestHeaders);
    var jsonData=jsonDecode((response.body));
    print(jsonData);
  }
}