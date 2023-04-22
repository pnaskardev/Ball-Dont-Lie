import 'package:ball_dont_lie/providers/league_provider/laliga_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandingsTable extends StatefulWidget {
  final String league;
  const StandingsTable({
    super.key,
    /*required this.index*/
    required this.league
  });

  @override
  State<StandingsTable> createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable>
    with AutomaticKeepAliveClientMixin<StandingsTable> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LaligaTeams>(context, listen: false).getLaligaTeams();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(child: Scaffold(
      body: Consumer<LaligaTeams>(
        builder: (context, value, child) {
          if (value.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (value.isError) {
            return const Center(child: Icon(Icons.error));
          }
          final fetchedTeams = value.getTeams;
          return ListView.builder(
              itemCount: fetchedTeams.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(fetchedTeams[index].name!),
                );
              });
        },
      ),
    ));
  }
}
