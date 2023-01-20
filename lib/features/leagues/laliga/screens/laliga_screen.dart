import 'package:ball_dont_lie/providers/league_provider/laliga_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaligaScreen extends StatefulWidget 
{
  final int index;
  const LaligaScreen({super.key,required this.index});

  @override
  State<LaligaScreen> createState() => _LaligaScreenState();
}

class _LaligaScreenState extends State<LaligaScreen> with AutomaticKeepAliveClientMixin<LaligaScreen>
{

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() 
  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) 
    {
      Provider.of<LaligaTeams>(context,listen: false).getLaligaTeams();
    });
    
  }

  @override
  Widget build(BuildContext context) 
  {
    super.build(context);
    return  SafeArea
    (
      child: Scaffold
      (
        body: Consumer<LaligaTeams>(builder: (context, value, child) 
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