
import 'package:ball_dont_lie/features/leagues/ISL/services/fetch_isl_teams.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:flutter/cupertino.dart';

class ISlTeams with ChangeNotifier
{
  List<Team> _islTeams=[];
  
  bool isLoading=false;

  final _service=ISLService();
  List<Team> get getTeams=> _islTeams;

  get getItemsLength
  { 
    return _islTeams.length;
  }

  void addislTeam(Team team)
  {
    _islTeams.add(team);
    notifyListeners();
  }

 
  Future<void> getIslTeams() async
  {
    isLoading=true;
    notifyListeners();

    final response= await _service.getislTeams();
    
    _islTeams=response;
    isLoading=false;
    notifyListeners();
  }


}