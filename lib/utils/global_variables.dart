import 'package:ball_dont_lie/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/cards/neopop_card.dart';

final List<Tab> leagueTabs = <Tab>
[
  Tab
  (
    // icon: Icon(Icons.directions_car),
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
          'LaLiga',
          style: Styles.tabStyle,
        ),
      ),
    )
  ),
  Tab
  (
    // child: Text('Premier League'),
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
          'Premier League',
          style: Styles.tabStyle,
        ),
      ),
    )
  ),
  Tab
  (
    // child: Text('BundesLiga'),
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
          'BundesLiga',
          style: Styles.tabStyle,
        ),
      ),
    )
  ),
  Tab
  (
    // child: Text('ISL'),
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
          'ISL',
          style: Styles.tabStyle,
        ),
      ),
    )
  ),
];


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
  // Tab
  // (
  //   // child: Text('Today'),
  // ),
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

// Map<int,Widget> MapIndexToWidget=
// {
//   0:const LaligaScreen(index: 0,),
//   1:const PremierleagueScreen(index: 1,),
//   2:const BundesligaScreen(index: 2,),
//   3:const IslScreen(index: 3,)
// };

// mapIndexToWidgetFun(int index)
// {
//   return MapIndexToWidget[index];
// }



var leagueHeaders =
[
  {'Items':"premierleague",},
  {'Items':"laliga",},
  {'Items':"bundesliga",},
  {'Items':"europaleague"},
  {'Items':"eredivisie"},
  {'Items':"europaconferenceleague"},
  {'Items':"fifaclubworldcup"},
  {'Items':"indiansuperleague"},
  {'Items':"majorleaguesoccer"},
];


Map<int,String> indexLeagueHeaders =
{
  0:"laliga",
  1:"premierleague",
  2:"bundesliga",
  3:"indiansuperleague",
};