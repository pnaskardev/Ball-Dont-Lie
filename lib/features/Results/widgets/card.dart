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
        // return index!=0? Card
        // (
        //   child: Text(fetchedResults[index].day!)
        // )
        // :
        // const SizedBox();
        return Center
        (
          child: InkWell
          (
            onTap: ()
            {
              Navigator.of(context).pushNamed
              (
                MatchDayResults.routeName,
                arguments: fetchedResults[index].match
              );
            },
            child: SizedBox
            (
              height: size.height*0.2,
              width: size.width*0.9,
              // child: Card
              // (
              //   semanticContainer: true,
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   shape: RoundedRectangleBorder
              //   (
              //     borderRadius: BorderRadius.circular(5.0)
              //   ),
              //   elevation: 5,
              //   margin: const EdgeInsets.all(10),
              //   child: Center
              //   (
              //     child: Text
              //     (
              //       fetchedResults[index].day!,
              //       // style: ,
              //     )
              //   ),
              // ),
              child: NeoPopCard
              (
                color: Colors.blueAccent,
                child: Center
                (
                  child: Text
                  (
                    fetchedResults[index].day!,
                    // style: ,
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