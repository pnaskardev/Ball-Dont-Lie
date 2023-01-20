import 'package:ball_dont_lie/providers/league_provider/isl_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IslScreen extends StatefulWidget 
{
  // final int index;
  const IslScreen({super.key,/*required this.index*/});

  @override
  State<IslScreen> createState() => _IslScreenState();
}

class _IslScreenState extends State<IslScreen>  with AutomaticKeepAliveClientMixin<IslScreen>
{
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() 
  {  
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) 
    {
      Provider.of<ISlTeams>(context,listen: false).getIslTeams();
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
        // body:FutureBuilder
        // (
        //   // future: fetchTeams(),
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
        // )
        body: Consumer<ISlTeams>(builder: (context, value, child) 
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