import 'package:ball_dont_lie/models/future_matchday.dart';
import 'package:ball_dont_lie/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class MatchdayFixtureCard extends StatelessWidget 
{
  FutureMatchday match;

  MatchdayFixtureCard({super.key,required this.match});

  @override
  Widget build(BuildContext context) 
  {
    return Padding
    (
      padding: const EdgeInsets.all(16.0),
      child: NeoPopCard
      (
        color: Colors.white24,
        borderColor: Colors.black,
        vShadowColor: Colors.deepPurpleAccent,
        hShadowColor: Colors.purpleAccent,
        depth: 10,
        child: Padding
        (
          padding: const EdgeInsets.all(16.0),
          // Wrapper row
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: 
                [
                  // Home side 
                  Column
                  (
                    children: 
                    [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage
                        (
                          imageUrl: match.homeLogo!,
                          progressIndicatorBuilder: (context, url, progress)
                          {
                            return CircularProgressIndicator
                            (
                              value: progress.progress,
                            );
                          },
                          errorWidget: (context, url, error) 
                          {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                      Text
                      (
                        match.homeTeam!,
                        style: Styles.teamName,
                      )
                    ],
                  ),
                  
                  // V/S box 
                  SizedBox
                  (
                    child: Text
                    (
                      'V/S',
                      style: Styles.teamName,
                    ),
                  ),
                  // Away side
                  Column
                  (
                    children: 
                    [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage
                        (
                            imageUrl: match.awayLogo!,
                            progressIndicatorBuilder: (context, url, progress)
                            {
                              return CircularProgressIndicator
                              (
                                value: progress.progress,
                              );
                            },
                            errorWidget: (context, url, error) 
                            {
                              return const Icon(Icons.error);
                            },
                        ),
                      ),
                      Text
                      (
                        match.awayTeam!,
                        style: Styles.teamName,
                      )
                    ],
                  ),
                  
                ],
              ),
              SizedBox
              (
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text
                  (
                    match.matchday!,
                    style: Styles.teamName,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}