import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/providers/league_provider/laliga_provider.dart';
import 'package:ball_dont_lie/utils/table_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaligaScreen extends StatelessWidget 
{
  final int index;
  const LaligaScreen({super.key,required this.index});

  @override
  Widget build(BuildContext context) 
  {
    List<Team> teams=Provider.of<LaligaTeams>(context,listen: false).getlaligaTeams;
    return  SafeArea
    (
      child: Scaffold
      (
        // body: Center(child:  Text('Laliga')),
        body: FutureBuilder
        (
          // future: fetchTeams(),
          future: Provider.of<LaligaTeams>(context,listen: false).getLaligaTeams(index),
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