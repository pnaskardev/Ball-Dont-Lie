import 'package:flutter/material.dart';

class BundesligaScreen extends StatelessWidget {
  const BundesligaScreen({super.key});

 @override
  Widget build(BuildContext context) 
  {
    return const SafeArea
    (
      child: Scaffold
      (
        body: Center(child:  Text('BundesLiga')),
      )
    );
  }
}