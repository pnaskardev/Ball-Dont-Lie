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
        length: 3,
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
                  backgroundColor: Colors.blueAccent,
                  flexibleSpace: const FlexibleSpaceBar
                  (
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title:  Text('Teams'),
                   
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
                  // bottom: const TabBar
                  // (
                  //   labelColor: Colors.black,
                  //   tabs: 
                  //   [
                  //     Tab(icon: Icon(Icons.directions_car)),
                  //     Tab(icon: Icon(Icons.directions_transit)),
                  //     Tab(icon: Icon(Icons.directions_bike)),
                  //   ]
                  // ),
                ),
                SliverPersistentHeader
                (
                  delegate: _SliverAppBarDelegate
                  (
                    const TabBar
                    (
                      labelColor: Colors.black,
                      tabs: 
                      [
                        Tab(icon: Icon(Icons.directions_car)),
                        Tab(icon: Icon(Icons.directions_transit)),
                        Tab(icon: Icon(Icons.directions_bike)),
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
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
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