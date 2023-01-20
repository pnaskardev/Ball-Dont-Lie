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

  late TabController _tabController;
  var _currentIndex=0;
  @override
  void initState() 
  {
    _tabController=TabController
    (
      length: leagueTabs.length,
      vsync: this
    );
    _tabController.addListener(_tabSelect);
    super.initState();
    
  }

  void _tabSelect()
  {
    setState(() 
    {
      _currentIndex=_tabController.index;
    });
  }

  @override
  void dispose() 
  {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) 
  {
    super.build(context);
    return  SafeArea
    (
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
                  TabBar
                  (
                    controller: _tabController,
                    isScrollable: true,
                    // labelColor: Colors.black,
                    tabs: leagueTabs,
                    
                  ),
                  
                ),
                pinned: true,
              ),
      
            ];
          },
          body:  Center
          (
            child: TabBarView
            (
              controller: _tabController,
              children: leagueTabs.map((Tab tab) 
              {
                return Center
                (
                  child: mapIndexToWidgetFun(_currentIndex),
                );
              }).toList(),
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