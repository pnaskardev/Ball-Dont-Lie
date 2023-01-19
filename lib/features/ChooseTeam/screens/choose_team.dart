import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/providers/teams.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChooseTeam extends StatelessWidget {
  const ChooseTeam({super.key});

  @override
  Widget build(BuildContext context) 
  {
    List<Team> teams=Provider.of<Teams>(context,listen: false).getItems;
    return SafeArea
    (
      child: Scaffold
      (
        body: FutureBuilder
        (
          // future: fetchTeams(),
          future: Provider.of<Teams>(context,listen: false).getTeams(),
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
                    // subtitle: Text(teams[index].city),
                  );
                }
              );
            }
            else if(snapshot.connectionState==ConnectionState.waiting)
            {
              return const Center(child: Text('API is not working properly'));
            }
            else
            {
              return const Center
              (
                child: CircularProgressIndicator(),
              );
            }
          }
        )
      ) 
    );
  }
}