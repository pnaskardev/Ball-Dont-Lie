import 'package:ball_dont_lie/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier
{
  static String? clientId;
  static bool didSignOut = false;

  List<model.User> users = [];


  User? firebaseUser;
  Future<void> getFirebaseUser() async 
  {
    this.firebaseUser = FirebaseAuth.instance.currentUser!;
  }

  static setUid() 
  {
    clientId = FirebaseAuth.instance.currentUser!.uid.toString();
  }

  Future<void> fetchAndSetusers() async 
  {
    CollectionReference _collectionRef =FirebaseFirestore.instance.collection('users');
    QuerySnapshot allDataQuerySnapshot = await _collectionRef.get();
    users = allDataQuerySnapshot.docs
        .map((doc) => doc.data())
        .toList()
        .map((e) => model.User.fromJson(e as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }


  Future<void> adduser(model.User t) async 
  {
    CollectionReference users = FirebaseFirestore.instance.collection('users1');
    String clientId = t.uid;
    await users.doc(clientId).set(t.toJson());
    await fetchAndSetusers();
    notifyListeners();
    return;
  }

}