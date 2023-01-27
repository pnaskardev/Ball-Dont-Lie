import 'package:flutter/material.dart';

class MatchDayResults extends StatelessWidget 
{
  const MatchDayResults({super.key});
  static const routeName = '/matchdayresult';
  @override
  Widget build(BuildContext context) 
  {
    return const Scaffold
    (
      body: Center(child: Text('Match Day Results'),),
    );
  }
}