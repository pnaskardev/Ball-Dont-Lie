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
          return const Text('results are laoded');
        },),
      )
    );
  }
}