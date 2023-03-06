import 'dart:convert';

import 'package:ball_dont_lie/api/Headers.dart';
import 'package:ball_dont_lie/models/news.dart';
import 'package:http/http.dart' as http; 
class NewsService
{
  Future<List<News>> getNews(String favLeague) async
  {
    
    try 
    {
      var response = await http.get(Uri.https(Headers.requestHeaders['X-RapidAPI-Host']!,'/$favLeague/news'),headers: Headers.requestHeaders);
      // print(response.body);
      var jsonData=jsonDecode((response.body));
      List<News>tempList=[];
      for(var eachTeam in jsonData)
      {
        final team=News.fromJson(eachTeam);
        tempList.add(team);
      }  
      return tempList;
    } catch (e) 
    {
      throw Exception(e);  
    }

   
  }
}