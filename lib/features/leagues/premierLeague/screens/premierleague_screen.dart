import 'package:ball_dont_lie/features/leagues/premierLeague/services/fetch_pl_teams.dart';
import 'package:ball_dont_lie/models/team.dart';
import 'package:ball_dont_lie/providers/league_provider/premierleague_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PremierleagueScreen extends StatefulWidget 
{
  // final int index;
  const PremierleagueScreen({super.key,/*required this.index*/});

  @override
  State<PremierleagueScreen> createState() => _PremierleagueScreenState();
}

class _PremierleagueScreenState extends State<PremierleagueScreen> with AutomaticKeepAliveClientMixin
{ 

  @override
  bool get wantKeepAlive => true;
  
  Future<void>? _loadingTeams;
  @override
  void initState() 
  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) 
    {
      Provider.of<PremierLeagueTeams>(context,listen: false).getPremierLeagueTeams();
    });
  }

  @override
  Widget build(BuildContext context) 
  {
    super.build(context);
    return SafeArea
    (
      child: Scaffold
      (
        // body: FutureBuilder
        // (
        //   future: _loadingTeams,
        //   builder: (context, snapshot) 
        //   {
        //     if(snapshot.connectionState==ConnectionState.done)
        //     {
        //       return teams.isEmpty
        //       ?
        //       const Center
        //       (
        //         child: Text('List is empty'),
        //       ) 
        //       :ListView.builder
        //       (
        //         itemCount: teams.length,
        //         itemBuilder:(context,index)
        //         {
        //           return ListTile
        //           (
        //             title: Text(teams[index].name!),
        //           );
        //         }
        //       );
        //     }
        //     else if(snapshot.connectionState==ConnectionState.waiting)
        //     {
              
        //       return const Center
        //       (
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     else
        //     {
        //       return const Center(child: Text('API is not working properly'));
        //     }
        //   }
        // ),
        body: Consumer<PremierLeagueTeams>(builder: (context, value, child) 
        {
          if(value.isLoading==true)
          {
            return const Center
            (
              child: CircularProgressIndicator(),
            );
          }
          final fetchedTeams=value.getTeams;
          return ListView.builder
          (
            itemCount: fetchedTeams.length,
            itemBuilder:(context,index)
            {
              return ListTile
              (
                title: Text(fetchedTeams[index].name!),
              );
            }
          );
        },),
      )
    );
  }
  

}