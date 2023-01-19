import 'package:flutter/material.dart';

class PremierleagueScreen extends StatelessWidget {
  const PremierleagueScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const SafeArea
    (
      child: Scaffold
      (
        body: Center(child:  Text('Premier League')),
      )
    );
  }
}