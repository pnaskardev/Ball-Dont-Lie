import 'package:ball_dont_lie/features/Results/screens/result_screen.dart';
import 'package:ball_dont_lie/features/Today/screens/today_screen.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>
{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) 
  {
    super.build(context);
    return SafeArea
    (
      child: Scaffold
      (
        body: DefaultTabController
        (
          length: resultTabs.length, 
          child: NestedScrollView
          (
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
            {
              return <Widget>
              [
                SliverAppBar.medium
                (
                  pinned: true,
                  floating: false,
                  backgroundColor: Colors.white30,
                  flexibleSpace: const FlexibleSpaceBar
                  (
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title:  Text
                    (
                      'Home',
                      style: TextStyle
                      (
                        color: Colors.black
                      ),
                    ),
                   
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
                  pinned: true,
                  delegate: _SliverAppBarDelegate
                  (
                    TabBar
                    (
                      // isScrollable: true,
                      labelColor: Colors.black,
                      tabs: resultTabs,
                    ),
                  ),
                  // pinned: true,
                ),
              
              ];
            }, 
            body: const Center
            (
              child: TabBarView
              (
                children: 
                [
                  Tab
                  (
                    // child: Text('Results')
                    child: ResultScreen(),
                  ),
                  Tab
                  (
                    // child: Text('Today')
                    child: TodayScreen(),
                  ),
                  Tab
                  (
                    child: Text('Fixtures')
                  ),
                  
                ],
              ),
            ),
          )
        )
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
        
        color: Colors.white30,
        child: _tabBar,
      );
    }

    @override
    bool shouldRebuild(_SliverAppBarDelegate oldDelegate) 
    {
      return false;
    }
}