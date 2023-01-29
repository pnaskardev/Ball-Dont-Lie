
import 'package:ball_dont_lie/features/leagues/laliga/services/fetch_laliga_teams.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:flutter/cupertino.dart';

class LaligaTeams with ChangeNotifier
{
  // Instance of the service class
  final LaligaService _service = LaligaService();
  bool isLoading=false;
  bool isError=false;
  List<Team> _laligaTeams=[];

  // Getter 
  List<Team> get getTeams=> _laligaTeams;

  get getItemsLength
  { 
    return _laligaTeams.length;
  }

  void addlaligaTeam(Team team)
  {
    
    _laligaTeams.add(team);
    notifyListeners();
  }


  Future<void> getLaligaTeams() async
  {
    

    try 
    {
      isLoading=true;
      notifyListeners();

      final response= await _service.getLaligaTeams();
      
      _laligaTeams=response;
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