import 'package:ball_dont_lie/features/MatchDayResults/widgets/MatchResultCard.dart';
import 'package:ball_dont_lie/models/matchday.dart';
import 'package:ball_dont_lie/models/results.dart';
import 'package:flutter/material.dart';

class MatchDayResults extends StatelessWidget 
{
  // final List<Matchday> dayResults;
  const MatchDayResults({super.key,/*required this.dayResults*/});
  static const routeName = '/matchdayresult';
  @override
  Widget build(BuildContext context) 
  {
    // final args = ModalRoute.of(context)!.settings.arguments as List;
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    final day=args.day;
    final List<Matchday>list=args.match!;
    return SafeArea
    (
      child: Scaffold
      (
        appBar: AppBar
        (
          title: Text(day!),
        ),
        body: ListView.builder
        (
          itemCount: list.length,
          itemBuilder: (context, index) 
          {
            return MatchResultCard
            (
              match: list[index],
            );
          }
        ),
      ),
    );
  }
}