import 'package:ball_dont_lie/features/MatchDayResults/screens/match_day_result_screen.dart';
import 'package:ball_dont_lie/models/results.dart';
import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class ResultCard extends StatelessWidget 
{
  final List<Results> fetchedResults;
  const ResultCard
  ({
    super.key,
    required this.fetchedResults
  });

  @override
  Widget build(BuildContext context) 
  {
    var size=MediaQuery.of(context).size;
    return ListView.builder
    (
      itemCount: fetchedResults.length,
      itemBuilder: (context, index) 
      {
        return Center
        (
          child: InkWell
          (
            onTap: ()
            {
              Navigator.of(context).pushNamed
              (
                MatchDayResults.routeName,
                arguments: fetchedResults[index]
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: NeoPopCard
              (
                color: Colors.white24,
                borderColor:Colors.black,
                depth: 10,
                hShadowColor: Colors.purpleAccent,
                vShadowColor: Colors.deepPurpleAccent,
                child: Center
                (
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text
                    (
                      fetchedResults[index].day!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}