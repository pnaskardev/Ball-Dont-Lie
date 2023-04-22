import 'package:ball_dont_lie/features/Standings/services/standings_service.dart';
import 'package:flutter/material.dart';

class StandingsTable extends StatefulWidget {
  final String league;
  const StandingsTable(
      {super.key,
      /*required this.index*/
      required this.league});

  @override
  State<StandingsTable> createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable>
    with AutomaticKeepAliveClientMixin<StandingsTable> {
  @override
  bool get wantKeepAlive => true;
  late final _standingsService=StandingsService();
  // @override
  // void initState() {
  //   super.initState();
  //   // _standingsService = StandingsService();
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea
    (
      child: Scaffold
      (
          body: FutureBuilder
          (
            future: _standingsService.getStandings(widget.league),
            builder: (context, snapshot) 
            {
                if(snapshot.connectionState == ConnectionState.waiting)
                {
                  return const Center
                  (
                    child: CircularProgressIndicator(),
                  );
                }
                else if (snapshot.hasError) 
                {
                  return Center
                  (
                    child: Text('Error: ${snapshot.error}'),
                  );
                } 
                else
                {
                  final fetchedTeams=snapshot.data;
                  return ListView.builder
                  (
                    itemCount: fetchedTeams!.length,
                    itemBuilder:(context,index)
                    {
                      return ListTile
                      (
                        title: Text(fetchedTeams[index].teamName!),
                      );
                    }
                  );
                }
            },
          )
      )
    );
  }
}


// Consumer<LaligaTeams>(
//         builder: (context, value, child) {
//           if (value.isLoading == true) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (value.isError) {
//             return const Center(child: Icon(Icons.error));
//           }
//           final fetchedTeams = value.getTeams;
//           return ListView.builder(
//               itemCount: fetchedTeams.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(fetchedTeams[index].name!),
//                 );
//               });
//         },
//       ),
