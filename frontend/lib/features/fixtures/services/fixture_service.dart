import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/fixture.dart';
import 'package:http/http.dart' as http; 
class FixtureService
{
  Future<List<Fixture>> getResults(String favLeague) async
  {
    List<Fixture>tempList=[];
    try 
    {
      var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/$favLeague/fixtures'),headers: Headers.requestHeaders);
      var jsonData=jsonDecode((response.body));
      jsonData[0].forEach((k,v)
      {
        // log('$k->$v');
        var res=Fixture.fromJson(k, v);
        tempList.add(res);
      });  
    } catch (e) 
    {
      
      throw Exception(e); 
    }
    return tempList;
  }
}