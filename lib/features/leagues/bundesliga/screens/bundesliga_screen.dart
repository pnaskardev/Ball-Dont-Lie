import 'package:ball_dont_lie/providers/league_provider/bundesliga_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BundesligaScreen extends StatefulWidget 
{
  // final int index;
  const BundesligaScreen({super.key,/*required this.index*/});

  @override
  State<BundesligaScreen> createState() => _BundesligaScreenState();
}

class _BundesligaScreenState extends State<BundesligaScreen> with AutomaticKeepAliveClientMixin<BundesligaScreen>
{
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() 
  {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) 
    {
      Provider.of<BundesLigaTeams>(context,listen: false).getbundesLigaTeams();
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
        body: Consumer<BundesLigaTeams>(builder: (context, value, child) 
        {
          if(value.isLoading==true)
          {
            return const Center
            (
              child: CircularProgressIndicator(),
            );
          }
          else if(value.isError==true)
          {
            return const Center
            (
              child: Icon(Icons.error)
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