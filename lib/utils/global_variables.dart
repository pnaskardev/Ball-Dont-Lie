import 'package:ball_dont_lie/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/cards/neopop_card.dart';

String uri = 'https://wild-rose-scorpion-robe.cyclic.app';
// String uri = 'http://192.168.0.104:3000';


final List<Tab> resultTabs=
[
  Tab
  (
    // child: Text('Results'),
    child: NeoPopCard
    (
      color: Colors.white30,
      borderColor: Colors.black,
      vShadowColor: Colors.deepPurpleAccent,
      hShadowColor: Colors.purpleAccent,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text
        (
          'Results',
          style: Styles.tabStyle,
        ),
      ),
    )
  ),
  Tab
  (
    // child: Text('Fixtures'),
    child: NeoPopCard
    (
      color: Colors.white30,
      borderColor: Colors.black,
      vShadowColor: Colors.deepPurpleAccent,
      hShadowColor: Colors.purpleAccent,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text
        (
          'Fixtures',
          style: Styles.tabStyle,
        ),
      ),
    )
  )
];


var leagueHeaders =
[
  {'Items':"premierleague",},
  {'Items':"laliga",},
  {'Items':"bundesliga",},
  {'Items':"ligue 1",},
  {'Items':"serie a",},
  {'Items':"indiansuperleague"},
];


Map<int,String> indexLeagueHeaders =
{
  0:"laliga",
  1:"premierleague",
  2:"bundesliga",
  3:"ligue1",
  4:"indiansuperleague",
};