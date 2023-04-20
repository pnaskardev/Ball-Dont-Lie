import 'package:ball_dont_lie/Auth/login_screen.dart';
import 'package:ball_dont_lie/Auth/signup_screen.dart';
import 'package:ball_dont_lie/features/MatchDayFixtures/screens/matchday_fixtures_screen.dart';
import 'package:ball_dont_lie/features/MatchDayResults/screens/match_day_result_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => LoginScreen());
    case SignupScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SignupScreen());
    case MatchDayResults.routeName:
      return MaterialPageRoute(
        builder: (_) => const MatchDayResults(),
      );
    case MatchDayFixtures.routeName:
      return MaterialPageRoute(
        builder: (_) => const MatchDayFixtures(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist '),
                ),
              ));
  }
}
