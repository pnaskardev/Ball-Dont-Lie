import 'package:ball_dont_lie/models/matchday.dart';
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
              Image.network(match.homeLogo!),
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