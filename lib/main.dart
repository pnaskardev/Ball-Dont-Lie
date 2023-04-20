
import 'package:ball_dont_lie/auth_gate.dart';
import 'package:ball_dont_lie/features/MatchDayFixtures/screens/matchday_fixtures_screen.dart';
import 'package:ball_dont_lie/features/MatchDayResults/screens/match_day_result_screen.dart';
import 'package:ball_dont_lie/providers/fav_league_provider.dart';
import 'package:ball_dont_lie/providers/fixture_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/bundesliga_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/isl_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/laliga_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/league_provider.dart';
import 'package:ball_dont_lie/providers/league_provider/premierleague_provider.dart';
import 'package:ball_dont_lie/providers/results_provider.dart';
import 'package:ball_dont_lie/providers/teams.dart';
import 'package:ball_dont_lie/providers/theme_provider.dart';
import 'package:ball_dont_lie/providers/transfer_provider.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:ball_dont_lie/routes/routes.dart';
import 'package:ball_dont_lie/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs=await SharedPreferences.getInstance();
  return runApp
  (
    ChangeNotifierProvider
    (
      create: (BuildContext context)=>ThemeProvider(isDarkMode: prefs.getBool("THEMESTATUS")?? true),
      child:const MyApp()
    ),
    
  );
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  // ThemeProvider themeChangeProvider = ThemeProvider();
  @override
  Widget build(BuildContext context) 
  {
    return MultiProvider
    (
      providers:
      [
        // ChangeNotifierProvider<ThemeProvider>(create: (context)=>ThemeProvider
        // (
        //   isDarkMode: prefs.getBool("THEMESTATUS")
        //   // isDarkMode: true
        // )),
        ChangeNotifierProvider<Teams>(create: (context)=>Teams()),
        ChangeNotifierProvider<LaligaTeams>(create: (context)=>LaligaTeams()),
        ChangeNotifierProvider<PremierLeagueTeams>(create: (context)=>PremierLeagueTeams()),
        ChangeNotifierProvider<BundesLigaTeams>(create: (context)=>BundesLigaTeams()),
        ChangeNotifierProvider<ISlTeams>(create: (context)=>ISlTeams()),
        ChangeNotifierProvider<ResultsProvider>(create: (context)=>ResultsProvider()),
        ChangeNotifierProvider<FixtureProvider>(create: (context)=>FixtureProvider()),
        ChangeNotifierProvider<UserProvider>(create: (context)=>UserProvider()),
        ChangeNotifierProvider<LeagueProvider>(create: (context)=>LeagueProvider()),
        ChangeNotifierProvider<FavProvider>(create: (context)=>FavProvider()),
        ChangeNotifierProvider<TransferProvider>(create: (context)=>TransferProvider()),
        
      ],
      child: Consumer<ThemeProvider>
      (
        builder: (context, value, child) 
        {
          return MaterialApp
          (
            debugShowCheckedModeBanner: false,
            theme: value.getTheme ,
            // darkTheme: Themes.darkTheme,
            // themeMode: ThemeMode.system,
            home: AuthGate(),
            onGenerateRoute: (settings) => generateRoute(settings),
          );
        },
      ),
    );
  }
}

