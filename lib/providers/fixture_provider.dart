import 'package:ball_dont_lie/features/fixtures/services/fixture_service.dart';
import 'package:ball_dont_lie/models/fixture.dart';
import 'package:flutter/cupertino.dart';

class FixtureProvider with ChangeNotifier
{

  final FixtureService _service=FixtureService();
  bool isLoading=false;
  bool isError=false;

  List<Fixture> _results=[];
  List<Fixture> get getResultsList=>_results;

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