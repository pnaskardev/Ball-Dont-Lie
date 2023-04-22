// ignore_for_file: prefer_const_constructors

import 'package:ball_dont_lie/features/Settings/screens/settings_page.dart';
import 'package:ball_dont_lie/features/Standings/screens/standings_page.dart';
import 'package:ball_dont_lie/features/home/screens/homepage.dart';
import 'package:ball_dont_lie/features/transfer/screens/transfer_page.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  static const routeName = '/navbar';
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final PageController controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: const Text('HomePage'),
        // body:<Widget>
        // [
        //   const HomePage(),
        //   const Standings(),
        //   const SettingsPage(),
        // ][currentPageIndex],
        body: PageView(
          // child: PageTransitionSwitcher
          // (
          //   duration: const Duration(milliseconds: 900),
          //   transitionBuilder: ((child,primaryAnimation,secondaryAnimation)
          //   {
          //     return FadeThroughTransition
          //     (
          //       animation: primaryAnimation,
          //       secondaryAnimation: secondaryAnimation,
          //       child: child,
          //     );
          //   }),
          //   // child: <Widget>
          //   // [
          //   //   const HomePage(),
          //   //   const Standings(),
          //   //   const SettingsPage(),
          //   // ][currentPageIndex]

          //   // State can be preserved with Stack

          //   // child: Stack
          //   // (
          //   //   children:
          //   //   [
          //   //     Offstage
          //   //     (
          //   //       offstage: currentPageIndex!=0,
          //   //       child:  HomePage()
          //   //     ),
          //   //     Offstage
          //   //     (
          //   //       offstage: currentPageIndex!=1,
          //   //       child: Standings()
          //   //     ),
          //   //     Offstage
          //   //     (
          //   //       offstage: currentPageIndex!=2,
          //   //       child: SettingsPage(),
          //   //     )
          //   //   ],
          //   // ),

          //   // Indexed stack is the alternative to
          //   // child: IndexedStack
          //   // (
          //   //   index: currentPageIndex,
          //   //   children: const <Widget>
          //   //   [
          //   //      HomePage(),
          //   //      Standings(),
          //   //      SettingsPage(),
          //   //   ]
          //   // ),
          // ),
          controller: controller,
          children: const <Widget>[
            // HomePage(),
            Standings(),
            TransferPage(),
            SettingsPage(),
          ],
          // onPageChanged has to be implemented so that if the
          // User swipes the tabs should be changed
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              controller.animateToPage(index,
                  duration: Duration(milliseconds: 250), curve: Curves.easeIn);
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            animationDuration: const Duration(seconds: 2),
            destinations: const <Widget>[
              // NavigationDestination(
              //   icon: Icon(Icons.score),
              //   label: 'Scores',
              // ),
              NavigationDestination(
                icon: Icon(Icons.table_bar_outlined),
                label: 'Standings',
              ),
              NavigationDestination(
                icon: Icon(Icons.newspaper),
                label: 'League News',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ]),
      ),
    );
  }
}
