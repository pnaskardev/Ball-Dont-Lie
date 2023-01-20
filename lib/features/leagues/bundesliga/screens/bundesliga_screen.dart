import 'package:ball_dont_lie/features/leagues/bundesliga/services/fetch_bundesliga_teams.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/providers/league_provider/bundesliga_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BundesligaScreen extends StatefulWidget 
{
  final int index;
  const BundesligaScreen({super.key,required this.index});

  @override
  State<BundesligaScreen> createState() => _BundesligaScreenState();
}

class _BundesligaScreenState extends State<BundesligaScreen> 
{
  Future<void>? _loadingTeams;

  @override
  void initState() 
  {
    _loadingTeams=FetchBundesligaTeams().getbundesLigaTeams(widget.index);
    super.initState();
  }

 @override
  Widget build(BuildContext context) 
  {
    List<Team> teams=Provider.of<BundesLigaTeams>(context,listen: false).getTeams;
    return SafeArea
    (
      child: Scaffold
      (
        body: FutureBuilder
        (
          // future: fetchTeams(),
          future: _loadingTeams,
          builder: (context, snapshot) 
          {
            if(snapshot.connectionState==ConnectionState.done)
            {
              return teams.isEmpty
              ?
              const Center
              (
                child: Text('List is empty'),
              ) 
              :ListView.builder
              (
                itemCount: teams.length,
                itemBuilder:(context,index)
                {
                  return ListTile
                  (
                    title: Text(teams[index].name!),
                  );
                }
              );
            }
            else if(snapshot.connectionState==ConnectionState.waiting)
            {
              
              return const Center
              (
                child: CircularProgressIndicator(),
              );
            }
            else
            {
              return const Center(child: Text('API is not working properly'));
            }
          }
        ),
      )
    );
  }
}