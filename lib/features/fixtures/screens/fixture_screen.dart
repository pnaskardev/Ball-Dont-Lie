import 'dart:developer';

import 'package:ball_dont_lie/features/fixtures/widgets/fixture_card.dart';
import 'package:ball_dont_lie/providers/fixture_provider.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FixtureScreen extends StatefulWidget 
{
  const FixtureScreen({super.key});

  @override
  State<FixtureScreen> createState() => _FixtureScreenState();
}

class _FixtureScreenState extends State<FixtureScreen> with AutomaticKeepAliveClientMixin 
{
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() 
  {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) 
    // {
    //   Provider.of<FixtureProvider>(context,listen: false).getResults(UserProvider.user!.favLeague);
    // });
  }


  @override
  Widget build(BuildContext context) 
  {
    super.build(context);
    return const SafeArea
    (
      child: Scaffold
      (
        // body: Consumer<FixtureProvider>(builder: (context, value, child)
        //   {
        //     if(value.isLoading==true)
        //     {
        //       return const Center
        //       (
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     else if(value.isError==true)
        //     {
        //       return const Center
        //       (
        //         child: Icon(Icons.error),
        //         // child: SizedBox(),
        //       );
        //     }
        //     final fetchedResults=value.getResultsList;
        //     log(fetchedResults.length.toString());
        //     return FixtureCard(fetchedResults: fetchedResults);
        //   }
        // )
        body: Center(child: Text('Fixture Screen'),),
      )
    );
  }
}