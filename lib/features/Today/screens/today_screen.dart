import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class TodayScreen extends StatelessWidget 
{
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const Center
    (
      child: NeoPopCard
      (
        color: Colors.white24,
        borderColor: Colors.black,
        hShadowColor: Colors.redAccent,
        vShadowColor: Colors.redAccent,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Neopop Card'),
        ),
      ),
    );
  }
}