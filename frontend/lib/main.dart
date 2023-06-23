
import 'package:ball_dont_lie/auth_gate.dart';
import 'package:ball_dont_lie/providers/fav_league_provider.dart';
import 'package:ball_dont_lie/providers/fixture_provider.dart';
import 'package:ball_dont_lie/providers/results_provider.dart';
import 'package:ball_dont_lie/providers/theme_provider.dart';
import 'package:ball_dont_lie/providers/transfer_provider.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:ball_dont_lie/routes/routes.dart';
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
        ChangeNotifierProvider<ResultsProvider>(create: (context)=>ResultsProvider()),
        ChangeNotifierProvider<FixtureProvider>(create: (context)=>FixtureProvider()),
        ChangeNotifierProvider<UserProvider>(create: (context)=>UserProvider()),
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

