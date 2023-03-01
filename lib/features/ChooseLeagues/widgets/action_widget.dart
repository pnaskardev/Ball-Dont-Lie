import 'package:ball_dont_lie/providers/league_provider/league_provider.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionWidget extends StatefulWidget 
{
  final String league; 
  ActionWidget({super.key,required this.league});

  @override
  State<ActionWidget> createState() => _ActionWidgetState();
}

class _ActionWidgetState extends State<ActionWidget> {
  bool _isSelected=false;

  @override
  Widget build(BuildContext context) 
  {
    return InputChip
    (
      label: Text(widget.league),
      selected: _isSelected,
      onSelected: (bool selected)
      {
        setState(() 
        {
          _isSelected=selected;  
        });
        Provider.of<LeagueProvider>(context,listen: false).addLeague(widget.league);
      },
      deleteIcon: const Icon(Icons.delete),
      onDeleted: () 
      {

      },
    );
  }
}