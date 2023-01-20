
import 'package:ball_dont_lie/features/leagues/premierLeague/services/fetch_pl_teams.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:flutter/cupertino.dart';

class PremierLeagueTeams with ChangeNotifier
{
  List<Team> _plTeams=[];
  bool isLoading=false;

  final _service=PLService();

  List<Team> get getTeams=>_plTeams;

  get getPLteamsLength
  { 
    return _plTeams.length;
  }

  void addPlteam(Team team)
  {
    _plTeams.add(team);
    notifyListeners();
  }

  Future<void> getPremierLeagueTeams() async
  {
    isLoading=true;
    notifyListeners();

    final response= await _service.getPLteams();
    
    _plTeams=response;
    isLoading=false;
    notifyListeners();
  }

}