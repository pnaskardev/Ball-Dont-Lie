import 'dart:developer';

import 'package:ball_dont_lie/features/Results/widgets/card.dart';
import 'package:ball_dont_lie/providers/results_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget 
{
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> with AutomaticKeepAliveClientMixin<ResultScreen>
{
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() 
  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) 
    {
      Provider.of<ResultsProvider>(context,listen: false).getResults();
    });
  }

  @override
  Widget build(BuildContext context) 
  {
    return SafeArea
    (
      child: Scaffold
      (
        body: Consumer<ResultsProvider>(builder: (context, value, child)
        {
          if(value.isLoading==true)
          {
            return const Center
            (
              child: CircularProgressIndicator(),
            );
          }
          final fetchedResults=value.getResultsList;
          log(fetchedResults.length.toString());
          // return Text('faf');
          return ResultCard(fetchedResults: fetchedResults);
          // return ListView.builder
          // (
          //   itemCount: fetchedResults.length,
          //   itemBuilder:(context,index)
          //   {
          //     // return ResultCard
          //     // (
          //     //   // title: Text(fetchedTeams[index].name!),
          //     //   fetchedResults: fetch,
          //     // );
          //     return Text(fetchedResults[index].day!);
          //   }
          // );
        },),
      )
    );
  }
}