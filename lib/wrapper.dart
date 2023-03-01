import 'package:ball_dont_lie/common/navbar/navbar.dart';
import 'package:ball_dont_lie/features/ChooseLeagues/screens/choose_leagues.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget 
{
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> 
{
  bool isData = false;
  bool isLoading = true;

  void initiate() async {
    UserProvider.setUid();
    var uid = UserProvider.clientId;
    await FirebaseFirestore.instance.collection('users').doc(uid).get().then
    (
      (DocumentSnapshot<Map<String, dynamic>> documentSnapshot) 
      {
        if (documentSnapshot.exists) 
        {
          setState(() 
          {
            isData = true;
          });
        }
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  void initState() 
  {
    super.initState();
    initiate();
  }

  @override
  Widget build(BuildContext context) 
  {
    if (isLoading) 
    {
      return const Center
      (
        child: CircularProgressIndicator(),
      );
    } 
    else if (isData) 
    {
      return const NavBar();
    } 
    else 
    {
      return const ChooseLeagues();
    }
  }
}