import 'package:flutter/material.dart';

class IslScreen extends StatelessWidget 
{
  const IslScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const SafeArea
    (
      child: Scaffold
      (
        body: Center(child:  Text('Indian Super League')),
      )
    );
  }
}