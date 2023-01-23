import 'dart:convert';
import 'dart:developer';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/results.dart';
import 'package:http/http.dart' as http; 
class ResultService
{
  Future<List<Results>> getResults() async
  {
    List<Results>tempList=[];
    var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/laliga/results'),headers: Headers.requestHeaders);
    var jsonData=jsonDecode((response.body));
    // log(jsonData[0].length.toString());
    // for(int i=0;i< jsonData[0].length;i++)
    // {
    //   log(jsonData[0][i]);
    //   final _tempRes=Results.fromJson(jsonData[0][i], jsonData[0][i].toString());
    // }
    
    // // tempList.add(_tempRes);
    jsonData[0].forEach((k,v)
    {
      // log('$k->$v');
      var res=Results.fromJson(k, v);
      tempList.add(res);
    });
    return tempList;
  }
}