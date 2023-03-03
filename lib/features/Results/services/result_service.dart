import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/common/error/screens/error_screen.dart';
import 'package:ball_dont_lie/models/results.dart';
import 'package:http/http.dart' as http; 
class ResultService
{
  Future<List<Results>> getResults(String favLeague) async
  {
    List<Results>tempList=[];
    try 
    {
      var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/$favLeague/results'),headers: Headers.requestHeaders);
      var jsonData=jsonDecode((response.body));
      jsonData[0].forEach((k,v)
      {
        // log('$k->$v');
        var res=Results.fromJson(k, v);
        tempList.add(res);
      });  
    } catch (e) 
    {
      
      ErrorScreen(errorMessage: e.toString(),);
      throw Exception(e); 
    }
    return tempList;
  }
}