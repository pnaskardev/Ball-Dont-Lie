import 'package:ball_dont_lie/models/user.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/cards/neopop_card.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatefulWidget 
{
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) 
  {
    return StreamBuilder
    (
      stream: FirebaseFirestore.instance.
      collection('users')
      .doc(context.read<UserProvider>().getClientId)
      .snapshots()
      .map((map) => User.fromJson(map.data()!)),
      builder: (context,snapshot)
      {
        if(snapshot.connectionState==ConnectionState.none)
        {
          return const Center
          (
            child: Text('Please connect to internet'),
          );
        }
        else if(snapshot.hasData)
        {
          final myUser = snapshot.data;
          return NeoPopCard
          (
            color: Colors.white24,
            borderColor:Colors.black,
            depth: 10,
            hShadowColor: Colors.purpleAccent,
            vShadowColor: Colors.deepPurpleAccent,
            child: Center
            (
              child: Column
              (
                children: 
                [
                  Padding
                  (
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile
                    (
                      title: Text('Profile Information',style: Theme.of(context).textTheme.titleLarge,),
                      trailing: const Icon(Icons.person)
                    ),
                  ),
                  Padding
                  (
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile
                    (
                      title: const Text('Name:-'),
                      trailing: Text
                      (
                        myUser!.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Padding
                  (
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile
                    (
                      title: const Text('Favourite League:-'),
                      trailing: Text
                      (
                        myUser!.favLeague,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              )
            ),
          );
        }
        return const Center
        (
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}