import 'package:ball_dont_lie/features/MatchDayFixtures/widgets/matchdayFixtureCard.dart';
import 'package:ball_dont_lie/models/fixture.dart';
import 'package:ball_dont_lie/models/future_matchday.dart';
import 'package:flutter/material.dart';

class MatchDayFixtures extends StatelessWidget 
{
  const MatchDayFixtures({super.key});
  static const routeName = '/matchdayfixture';
  @override
  Widget build(BuildContext context) 
  {
    final args = ModalRoute.of(context)!.settings.arguments as Fixture;
    final List<FutureMatchday> list=args.match!;
    return SafeArea
    (
      child: Scaffold
      (
        appBar: AppBar
        (
          centerTitle: true,
          title: Text(args.day!),
        ),
        body: ListView.builder
        (
          itemCount: list.length,
          itemBuilder: (context, index) 
          {
            return MatchdayFixtureCard
            (
              match: list[index],
            );
          }
        ),
      ),
    );
  }
}