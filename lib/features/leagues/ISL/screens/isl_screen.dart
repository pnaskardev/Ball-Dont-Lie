import 'package:ball_dont_lie/features/leagues/ISL/services/fetch_isl_teams.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/providers/league_provider/isl_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IslScreen extends StatefulWidget 
{
  final int index;
  const IslScreen({super.key,required this.index});

  @override
  State<IslScreen> createState() => _IslScreenState();
}

class _IslScreenState extends State<IslScreen> 
{
  Future<void>? _loadingTeams;
  @override
  void initState() 
  {
    _loadingTeams = FetchISLTeams().getislTeams(widget.index);  
    super.initState();
  }
  @override
  Widget build(BuildContext context) 
  {
    List<Team> teams=Provider.of<ISlTeams>(context,listen: false).getTeams;
    return SafeArea
    (
      child: Scaffold
      (
        body:FutureBuilder
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
        )
      )
    );
  }
}