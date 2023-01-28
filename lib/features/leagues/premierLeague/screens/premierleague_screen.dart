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
        body: Consumer<PremierLeagueTeams>(builder: (context, value, child) 
        {
          if(value.isLoading==true)
          {
            return const Center
            (
              child: CircularProgressIndicator(),
            );
          }
          else if(value.isError)
          {
            return const Center(child: Icon(Icons.error));
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