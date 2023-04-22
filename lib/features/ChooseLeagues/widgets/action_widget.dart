import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionWidget extends StatefulWidget {
  ActionWidget(
      {super.key,
      required this.leagueHeaders,
      required this.index,
      required this.selectedItems});
  int index;
  // ignore: prefer_typing_uninitialized_variables
  final leagueHeaders;
  List<String> selectedItems;
  @override
  State<ActionWidget> createState() => _ActionWidgetState();
}

class _ActionWidgetState extends State<ActionWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.leagueHeaders[widget.index]['Items']!),
      trailing: _isSelected == true
          ? IconButton(
              onPressed: () {
                setState(() {
                  widget.selectedItems.remove(widget.leagueHeaders[widget.index]['Items']!);
                  _isSelected = false;
                });
              },
              icon: const Icon(Icons.delete))
          : IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.selectedItems
                      .add(widget.leagueHeaders[widget.index]['Items']!);
                  _isSelected = true;
                });
              },
            ),
    );
  }
}
