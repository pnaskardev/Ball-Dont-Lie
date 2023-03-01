import 'package:flutter/material.dart';

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
      },
      deleteIcon: const Icon(Icons.delete),
      onDeleted: () 
      {

      },
    );
  }
}