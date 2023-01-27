import 'package:ball_dont_lie/features/MatchDayResults/widgets/MatchResultCard.dart';
import 'package:ball_dont_lie/models/matchday.dart';
import 'package:flutter/material.dart';

class MatchDayResults extends StatelessWidget 
{
  // final List<Matchday> dayResults;
  const MatchDayResults({super.key,/*required this.dayResults*/});
  static const routeName = '/matchdayresult';
  @override
  Widget build(BuildContext context) 
  {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold
    (
      body: ListView.builder
      (
        itemCount: args.length,
        itemBuilder: (context, index) 
        {
          return MatchResultCard
          (
            match: args[index],
          );
        }
      ),
    );
  }
}