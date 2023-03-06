import 'dart:developer';

import 'package:ball_dont_lie/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier
{

  bool isLoading=false;
  bool isError=false;

  static String? clientId;
  static bool didSignOut = false;
  static model.User? user;
  List<model.User> users = [];


  get getClientId=>clientId!;

  User? firebaseUser;
  Future<void> getFirebaseUser() async 
  {
    this.firebaseUser = FirebaseAuth.instance.currentUser!;
  }

  static setUid() 
  {
    clientId = FirebaseAuth.instance.currentUser!.uid.toString();
  }

  Future<void> setUser() async
  {
   try 
   {
    await fetchAndSetusers();  
    user=users.firstWhere((e)=>e.uid==clientId);
    log(user!.uid);
   } 
   catch (e) 
   {
    log(e.toString());
     throw Exception(e.toString());
   }
    
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
    log(users.length.toString());
    notifyListeners();
  }



  Future<void> adduser(model.User t) async 
  {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String clientId = t.uid;
    try 
    {
      isLoading=true;
      notifyListeners();
      await users.doc(clientId).set(t.toJson());
      await fetchAndSetusers();
      user=t;  
      isLoading=false;
      notifyListeners();
    } catch (e) 
    {
      log(e.toString());
      isError=true;
      notifyListeners();
      throw Exception(e);
    }
    notifyListeners();
    return;
  }

  void addLeague(String league)
  {
    user!.selectedLeags.add(league);
    log(league);
    notifyListeners();
  }

}