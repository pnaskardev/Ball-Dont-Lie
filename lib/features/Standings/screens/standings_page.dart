import 'package:ball_dont_lie/features/leagues/ISL/screens/isl_screen.dart';
import 'package:ball_dont_lie/features/leagues/bundesliga/screens/bundesliga_screen.dart';
import 'package:ball_dont_lie/features/leagues/laliga/screens/laliga_screen.dart';
import 'package:ball_dont_lie/features/leagues/premierLeague/screens/premierleague_screen.dart';
import 'package:flutter/material.dart';

class Standings extends StatelessWidget 
{
  const Standings({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return  SafeArea
    (
      child: DefaultTabController
      (
        length: 4,
        child: Scaffold
        (
          body: NestedScrollView
          (
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
            {
              return <Widget>
              [
                SliverAppBar.medium
                (
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.indigo,
                  flexibleSpace: const FlexibleSpaceBar
                  (
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title:  Text('Standings'),
                   
                  ),
                  // title: const Text('Teams'),
                  leading: IconButton
                  (
                    onPressed: (){}, 
                    icon: const Icon(Icons.menu)
                  ),
                  actions: 
                  [
                    IconButton
                    (
                      onPressed: (){}, 
                      icon: const Icon(Icons.more_vert)
                    )
                  ],
                ),
                SliverPersistentHeader
                (
                  delegate: _SliverAppBarDelegate
                  (
                    const TabBar
                    (
                      isScrollable: true,
                      labelColor: Colors.black,
                      tabs: 
                      [
                        Tab
                        (
                          // icon: Icon(Icons.directions_car),
                          child: Text('LaLiga')
                        ),
                        Tab
                        (
                          // icon: Icon(Icons.directions_transit),
                          child: Text('Premier League'),
                        ),
                        Tab
                        (
                          // icon: Icon(Icons.directions_transit),
                          child: Text('BundesLiga'),
                        ),
                        Tab
                        (
                          // icon: Icon(Icons.directions_bike),
                          child: Text('ISL'),
                        ),
                      ]
                    
                    ),
                    
                  ),
                  pinned: true,
                ),
      
              ];
            },
            body: const Center
            (
              child: TabBarView
              (
                children: 
                [
                  LaligaScreen(),
                  PremierleagueScreen(),
                  BundesligaScreen(),
                  IslScreen()
                ],
              ),
            ),
          
          ),
        ),
      )
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate 
{
    _SliverAppBarDelegate(this._tabBar);

    final TabBar _tabBar;

    @override
    double get minExtent => _tabBar.preferredSize.height;
    @override
    double get maxExtent => _tabBar.preferredSize.height;

    @override
    Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) 
    {
      return  Container
      (
        child: _tabBar,
      );
    }

    @override
    bool shouldRebuild(_SliverAppBarDelegate oldDelegate) 
    {
      return false;
    }
}