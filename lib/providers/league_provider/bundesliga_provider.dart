
import 'package:ball_dont_lie/features/leagues/bundesliga/services/fetch_bundesliga_teams.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:flutter/cupertino.dart';

class BundesLigaTeams with ChangeNotifier
{
  List<Team> _bundesLigaTeams=[];
  bool isLoading=false;
  bool isError=false;
  final _service=BundesligaService();
  get getTeams
  {
    return _bundesLigaTeams;
  }

  get getItemsLength
  { 
    return _bundesLigaTeams.length;
  }

  void addbundesLigaTeam(Team team)
  {
    _bundesLigaTeams.add(team);
    notifyListeners();
  }

  Future<void> getbundesLigaTeams() async
  {
    try 
    {
      isLoading=true;
      notifyListeners();

      final response= await _service.getbundesLigaTeams();
      
      _bundesLigaTeams=response;
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