import 'package:ball_dont_lie/models/matchday.dart';
import 'package:ball_dont_lie/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class MatchResultCard extends StatelessWidget 
{
  MatchResultCard({super.key, required this.match});
  Matchday match;
  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: NeoPopCard
      (
        color: Colors.white24,
        borderColor: Colors.black,
        vShadowColor: Colors.deepPurpleAccent,
        hShadowColor: Colors.purpleAccent,
        depth: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: 
            [
              // Left side Column
              Column
              (
                children: 
                [
                  // Image.network(match.homeLogo!),
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
                  ),
                  Text
                  (
                    match.homeTeamScore!,
                    style: Styles.teamName,
                  )
                ],
              ),

              // V/S
              SizedBox
              (
                child: Text
                (
                  'V/S',
                  style: Styles.teamName,
                ),
              ),

              // Right Side column
              Column
              (
                children: 
                [
                  // Image.network(match.awayLogo!),
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
                  ),
                  Text
                  (
                    match.awayTeamScore!,
                    style: Styles.teamName,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}