
import 'package:ball_dont_lie/auth_gate.dart';
import 'package:ball_dont_lie/common/navbar/navbar.dart';
import 'package:ball_dont_lie/features/MatchDayFixtures/screens/matchday_fixtures_screen.dart';
import 'package:ball_dont_lie/features/MatchDayResults/screens/match_day_result_screen.dart';
import 'package:ball_dont_lie/firebase_options.dart';
import 'package:ball_dont_lie/models/results.dart';
import 'package:ball_dont_lie/providers/fixture_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/bundesliga_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/isl_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/laliga_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/premierleague_provider.dart';
import 'package:ball_dont_lie/providers/results_provider.dart';
import 'package:ball_dont_lie/providers/teams.dart';
import 'package:ball_dont_lie/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:provider/provider.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterFireUIAuth.configureProviders
  ([
    const EmailProviderConfiguration()
  ]);
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
        ChangeNotifierProvider<FixtureProvider>(create: (context)=>FixtureProvider()),
      ],
      child: MaterialApp
      (
        debugShowCheckedModeBanner: false,
        // theme: ThemeData
        // (
        //   useMaterial3: true,
        //   appBarTheme: const AppBarTheme
        //   (
        //     centerTitle: true
        //   ),
        //   tabBarTheme: const TabBarTheme
        //   (
        //     labelColor: Colors.black,
        //     // labelStyle: TextStyle(color: Colors.pink[800]), // color for text
        //     indicator:  UnderlineTabIndicator
        //     ( // color for indicator (underline)
        //       borderSide: BorderSide(color: Colors.indigoAccent)
        //     ),
        //   ),
        //   primarySwatch: Colors.blue,
        // ),
        theme: Themes.lightTheme ,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.system,
        home:  const AuthGate(),
        routes: 
        {
          MatchDayResults.routeName:(context) => const MatchDayResults(),
          MatchDayFixtures.routeName:(context) => const MatchDayFixtures(), 
        },
      ),
    );
  }
}

