import 'package:ball_dont_lie/features/Results/screens/result_screen.dart';
import 'package:ball_dont_lie/features/fixtures/screens/fixture_screen.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  bool _isInit = true;

  @override
  void didChangeDependencies() async
  {
    super.didChangeDependencies();
    if(_isInit)
    {
      await Provider.of<UserProvider>(context, listen: false)
          .fetchAndSetusers()
          .then((value) async =>
          {
            
            await Provider.of<UserProvider>(context, listen: false)
                      .setUser()
          });
    }
    _isInit=false;
  }

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
                SliverAppBar
                (
                  pinned: true,
                  floating: false,
                  // backgroundColor: Colors.white30,
                  expandedHeight: 400,
                  flexibleSpace: FlexibleSpaceBar
                  (
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title: Text
                    (
                      'Home',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith
                      (
                        color: Colors.purpleAccent
                      ),
                    ),
                    background: CachedNetworkImage
                    (
                      imageUrl: 'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                      fit: BoxFit.cover, 
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
                    // child: Text('Fixtures')
                    child: FixtureScreen(),
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

// Widget buildResult()=>const SliverToBoxAdapter
// (
//   child: Expanded
//   (
//     child: ResultScreen()
//   ),
// );

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
        child: _tabBar,
      );
    }

    @override
    bool shouldRebuild(_SliverAppBarDelegate oldDelegate) 
    {
      return false;
    }
}