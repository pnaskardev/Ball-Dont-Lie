import 'dart:developer';

import 'package:ball_dont_lie/features/Results/widgets/result_card.dart';
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
    super.build(context);
    return Scaffold
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
        else if(value.isError==true)
        {
          return const Center
          (
            child: Icon(Icons.error),
            // child: SizedBox(),
          );
        }
        final fetchedResults=value.getResultsList;
        log(fetchedResults.length.toString());
        return ResultCard(fetchedResults: fetchedResults);
      },),
    );
  }
}