import 'package:ball_dont_lie/features/leagues/ISL/screens/isl_screen.dart';
import 'package:ball_dont_lie/features/leagues/bundesliga/screens/bundesliga_screen.dart';
import 'package:ball_dont_lie/features/leagues/laliga/screens/laliga_screen.dart';
import 'package:ball_dont_lie/features/leagues/premierLeague/screens/premierleague_screen.dart';
import 'package:flutter/material.dart';

final List<Tab> leagueTabs = <Tab>
[
  const Tab
  (
    // icon: Icon(Icons.directions_car),
    child: Text('LaLiga')
  ),
  const Tab
  (
    // icon: Icon(Icons.directions_transit),
    child: Text('Premier League'),
  ),
  const Tab
  (
    // icon: Icon(Icons.directions_transit),
    child: Text('BundesLiga'),
  ),
  const Tab
  (
    // icon: Icon(Icons.directions_bike),
    child: Text('ISL'),
  ),
];

Map<int,Widget> MapIndexToWidget=
{
  0:const LaligaScreen(),
  1:const PremierleagueScreen(),
  2:const BundesligaScreen(),
  3:const IslScreen()
};

mapIndexToWidgetFun(int index)
{
  return MapIndexToWidget[index];
}



Map<String,String> leagueHeaders =
{
  'premierLeague':"premierleague",
  'laliga':"laliga",
  'bundesliga':"bundesliga",
  'europaleague':"europaleague",
  'eredivisie':"eredivisie",
  'europaconferenceleague':"europaconferenceleague",
  'fifaclubworldcup':"fifaclubworldcup",
  'indiansuperleague':"indiansuperleague",
  'majorleaguesoccer':"majorleaguesoccer",
};