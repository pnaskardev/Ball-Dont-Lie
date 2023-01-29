import 'package:ball_dont_lie/features/MatchDayFixtures/screens/matchday_fixtures_screen.dart';
import 'package:ball_dont_lie/models/fixture.dart';
import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class FixtureCard extends StatelessWidget 
{

  List<Fixture> fetchedResults=[];
  FixtureCard({super.key,required this.fetchedResults});

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
                MatchDayFixtures.routeName,
                arguments: fetchedResults[index]
              );
            },
            child: Padding
            (
              padding: const EdgeInsets.all(16.0),
              child:NeoPopCard
              (
                color: Colors.white24,
                borderColor: Colors.black,
                depth: 10,
                size: size*0.5,
                hShadowColor: Colors.purpleAccent,
                vShadowColor: Colors.deepPurpleAccent,
                child: Padding
                (
                  padding: const EdgeInsets.all(16.0),
                  child: Text
                  (
                    fetchedResults[index].day!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              )
            ),
          ),
        ); 
      },
    );
  }
}