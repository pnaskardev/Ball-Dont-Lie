import 'package:flutter/material.dart';

class LaligaScreen extends StatelessWidget 
{
  const LaligaScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const SafeArea
    (
      child: Scaffold
      (
        body: Center(child:  Text('Laliga')),
      )
    );
  }
}