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


final List<Tab> resultTabs=
[
  const Tab
  (
    child: Text('Results'),
  ),
  const Tab
  (
    child: Text('Fixtures'),
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


Map<int,String> indexLeagueHeaders =
{
  0:"laliga",
  1:"premierleague",
  2:"bundesliga",
  3:"indiansuperleague",
};