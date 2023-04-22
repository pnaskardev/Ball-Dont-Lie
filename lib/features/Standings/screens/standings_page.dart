import 'package:ball_dont_lie/common/widgets/neopop_card_common.dart';
import 'package:ball_dont_lie/features/Standings/widgets/standings_body.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          length: Provider.of<UserProvider>(context).user.selectedLeagues.length,
          child: NestedScrollView
          (
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
            {
              
              return <Widget>
              [
                SliverAppBar
                (
                  pinned: true,
                  floating: true,
                  snap: true,
                  expandedHeight: 300,
                  forceElevated: innerBoxIsScrolled,
                  // backgroundColor: Colors.white30,
                  flexibleSpace: FlexibleSpaceBar
                  (
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title: Text
                    (
                      'Standings',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    background: CachedNetworkImage
                    (
                      imageUrl: 'https://images.unsplash.com/photo-1508098682722-e99c43a406b2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
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
                  delegate: _SliverAppBarDelegate
                  (
                    TabBar
                    (
                      isScrollable: true,
                      // tabs: leagueTabs,
                      tabs: List.generate
                      (
                        Provider.of<UserProvider>(context).user.selectedLeagues.length,
                        (index) => Tab
                        (
                          child: NeopopCardGlobal(text: Provider.of<UserProvider>(context).user.selectedLeagues[index]),
                        )
                      ),
                      
                    ),
                    
                  ),
                  pinned: true,
                ),
              
              ];
            },
            body: Center
            (
              child: TabBarView
              (
                children: List.generate
                (
                  Provider.of<UserProvider>(context).user.selectedLeagues.length,
                  (index) => Tab
                  (
                    child: StandingsTable(league:Provider.of<UserProvider>(context).user.selectedLeagues[index] ),
                  )
                ),
                // [
                //   Tab
                //   (
                //     child: LaligaScreen(),
                //   ),
                //    Tab
                //   (
                //     child: PremierleagueScreen(),
                //   ),
                //    Tab
                //   (
                //     child: BundesligaScreen(),
                //   ),
                //    Tab
                //   (
                //     child: IslScreen(),
                //   ),
                // ],
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
        // color: Colors.white30,
        child: _tabBar,
      );
    }

    @override
    bool shouldRebuild(_SliverAppBarDelegate oldDelegate) 
    {
      return false;
    }
}