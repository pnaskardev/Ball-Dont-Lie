
import 'package:ball_dont_lie/models/news.dart';
import 'package:ball_dont_lie/repository/news_repository.dart';
import 'package:flutter/material.dart';

class TransferProvider with ChangeNotifier
{
  final NewsService _service = NewsService();
  bool isLoading=false;
  bool isError=false;
  List<News> _news=[];

    // Getter 
  List<News> get getTeams=> _news;

  get getItemsLength
  { 
    return _news.length;
  }


  Future<void> getNews(String favLeague) async
  {
    try 
    {
      isLoading=true;
      notifyListeners();

      final response= await _service.getNews(favLeague);
      
      _news=response;
      isLoading=false;
      notifyListeners();
    } catch (e) 
    {
      isLoading=false;
      notifyListeners();

      isError=true;
      notifyListeners();
    }

  }

}