import 'package:flutter/material.dart';

class Standings extends StatelessWidget 
{
  const Standings({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const SafeArea
    (
      child: Scaffold
      (
        body: Center
        (
          child: Text('Standings')
        ),
      )
    );
  }
}