
import 'package:animations/animations.dart';
import 'package:ball_dont_lie/features/ChooseTeam/screens/choose_team.dart';
import 'package:ball_dont_lie/features/Settings/screens/settings_page.dart';
import 'package:ball_dont_lie/features/Standings/screens/standings_page.dart';
import 'package:ball_dont_lie/features/home/screens/homepage.dart';
import 'package:flutter/material.dart';
class NavBar extends StatefulWidget 
{
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> 
{
  @override
  int currentPageIndex = 0;
  Widget build(BuildContext context) 
  {
    
    return   SafeArea
    (
      child: Scaffold
      (
        // body: const Text('HomePage'),
        // body:<Widget>
        // [
        //   const HomePage(),
        //   const Standings(),
        //   const SettingsPage(),
        // ][currentPageIndex],
        body: PageTransitionSwitcher
        (
          duration: const Duration(milliseconds: 900),
          transitionBuilder: ((child,primaryAnimation,secondaryAnimation)
          {
            return FadeThroughTransition
            (
              animation: primaryAnimation, 
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          }),
          child: <Widget>
          [
            const HomePage(),
            // const ChooseTeam(),
            const Standings(),
            const SettingsPage(),
          ][currentPageIndex]
        ),
        bottomNavigationBar: NavigationBar
        (
          onDestinationSelected: (int index)
          {
            setState(() 
            {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          animationDuration: const Duration(seconds: 2),
          destinations: const <Widget>
          [
            NavigationDestination
            (
              icon: Icon(Icons.score_sharp),
              label: 'Scores',
            ),
            // NavigationDestination
            // (
            //   icon: Icon(Icons.telegram),
            //   label: 'Choose Teams',
            // ),
            NavigationDestination
            (
              icon: Icon(Icons.table_bar_outlined),
              label: 'Standings',
            ),
            NavigationDestination
            (
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]
        ),
      ),
      
    );
  }
}