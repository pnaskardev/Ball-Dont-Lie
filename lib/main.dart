
import 'package:ball_dont_lie/common/navbar/navbar.dart';
import 'package:ball_dont_lie/models/results.dart';
import 'package:ball_dont_lie/providers/league_provider/bundesliga_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/isl_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/laliga_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/premierleague_provider.dart';
import 'package:ball_dont_lie/providers/results_provider.dart';
import 'package:ball_dont_lie/providers/teams.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async
{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MultiProvider
    (
      providers:
      [
        ChangeNotifierProvider<Teams>(create: (context)=>Teams()),
        ChangeNotifierProvider<LaligaTeams>(create: (context)=>LaligaTeams()),
        ChangeNotifierProvider<PremierLeagueTeams>(create: (context)=>PremierLeagueTeams()),
        ChangeNotifierProvider<BundesLigaTeams>(create: (context)=>BundesLigaTeams()),
        ChangeNotifierProvider<ISlTeams>(create: (context)=>ISlTeams()),
        ChangeNotifierProvider<ResultsProvider>(create: (context)=>ResultsProvider()),
      ],
      child: MaterialApp
      (
        debugShowCheckedModeBanner: false,
        theme: ThemeData
        (
          useMaterial3: true,
          appBarTheme: const AppBarTheme
          (
            centerTitle: true
          ),
          tabBarTheme: const TabBarTheme
          (
            labelColor: Colors.black,
            // labelStyle: TextStyle(color: Colors.pink[800]), // color for text
            indicator:  UnderlineTabIndicator
            ( // color for indicator (underline)
              borderSide: BorderSide(color: Colors.indigoAccent)
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        home:  const NavBar()
      ),
    );
  }
}

