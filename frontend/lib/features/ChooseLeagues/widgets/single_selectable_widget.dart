import 'package:ball_dont_lie/providers/fav_league_provider.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleSelectableWidget extends StatefulWidget 
{
  const SingleSelectableWidget({super.key});
  @override
  State<SingleSelectableWidget> createState() => _SingleSelectableWidgetState();
}

class _SingleSelectableWidgetState extends State<SingleSelectableWidget> 
{
  late int selectedIndex=-1;
  @override
  Widget build(BuildContext context) 
  {
    return GridView.count
    (
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      shrinkWrap: true,
      children: List.generate(leagueHeaders.length, (index) 
      {
        return ActionChip
        (
          label: Text(leagueHeaders[index]['Items']!),
          backgroundColor: selectedIndex==index ? Colors.purple: Colors.blueGrey,
          onPressed: ()
          {
            setState(() 
            {
              selectedIndex=index;
            });
          },
        );
      }),
    );
  }
}