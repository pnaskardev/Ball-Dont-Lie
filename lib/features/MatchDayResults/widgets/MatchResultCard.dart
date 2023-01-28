import 'package:ball_dont_lie/models/matchday.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MatchResultCard extends StatelessWidget 
{
  MatchResultCard({super.key, required this.match});
  Matchday match;
  @override
  Widget build(BuildContext context) 
  {
    return Card
    (
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
              CachedNetworkImage
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
              Text(match.homeTeamScore!)
            ],
          ),
          // Right Side column
          Column
          (
            children: 
            [
              Image.network(match.awayLogo!),
              Text(match.awayTeamScore!)
            ],
          )
        ],
      ),
    );
  }
}