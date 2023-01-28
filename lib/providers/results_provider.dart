import 'package:ball_dont_lie/features/Results/services/result_service.dart';
import 'package:ball_dont_lie/models/results.dart';
import 'package:flutter/cupertino.dart';

class ResultsProvider with ChangeNotifier
{
  final ResultService _service=ResultService();
  bool isLoading=false;
  bool isError=false;
  List<Results> _results=[];
  List<Results> get getResultsList=>_results;

  Future<void> getResults()async
  {
    

    try 
    {
      isLoading=true;
      notifyListeners();
      
      final response=await _service.getResults();
      _results=response;
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