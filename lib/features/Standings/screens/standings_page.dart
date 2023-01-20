import 'package:ball_dont_lie/features/leagues/ISL/screens/isl_screen.dart';
import 'package:ball_dont_lie/features/leagues/bundesliga/screens/bundesliga_screen.dart';
import 'package:ball_dont_lie/features/leagues/laliga/screens/laliga_screen.dart';
import 'package:ball_dont_lie/features/leagues/premierLeague/screens/premierleague_screen.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:flutter/material.dart';

class Standings extends StatefulWidget 
{
  const Standings({super.key});

  @override
  State<Standings> createState() => _StandingsState();
}

class _StandingsState extends State<Standings> with SingleTickerProviderStateMixin , AutomaticKeepAliveClientMixin<Standings>
{
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) 
  {
    super.build(context);
    return  SafeArea
    (
      child: Scaffold
      (
        body: DefaultTabController
        (
          length: leagueTabs.length,
          child: NestedScrollView
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
                    TabBar
                    (
                      isScrollable: true,
                      // labelColor: Colors.black,
                      tabs: leagueTabs,
                      
                    ),
                    
                  ),
                  pinned: true,
                ),
              
              ];
            },
            body:  const Center
            (
              child: TabBarView
              (
                // children: leagueTabs.map((Tab tab) 
                // {
                //   return Center
                //   (
                //     child: mapIndexToWidgetFun(DefaultTabController.of(context)!.index),
                //   );
                // }).toList(),
                children: 
                [
                   Tab
                  (
                    // icon: Icon(Icons.directions_car),
                    // child: Text('LaLiga')
                    child: LaligaScreen(),
                  ),
                   Tab
                  (
                    // icon: Icon(Icons.directions_transit),
                    // child: Text('Premier League'),
                    child: PremierleagueScreen(),
                  ),
                   Tab
                  (
                    // icon: Icon(Icons.directions_transit),
                    // child: Text('BundesLiga'),
                    child: BundesligaScreen(),
                  ),
                   Tab
                  (
                    // icon: Icon(Icons.directions_bike),
                    // child: Text('ISL'),
                    child: IslScreen(),
                  ),
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
      return  Material
      (
        color: Colors.white,
        child: _tabBar,
      );
    }

    @override
    bool shouldRebuild(_SliverAppBarDelegate oldDelegate) 
    {
      return false;
    }
}