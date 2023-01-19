
import 'package:ball_dont_lie/common/navbar/navbar.dart';
import 'package:ball_dont_lie/providers/teams.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async
{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MultiProvider
    (
      providers:
      [
        ChangeNotifierProvider<Teams>(create: (context)=>Teams()),
      ],
      child: MaterialApp
      (
        debugShowCheckedModeBanner: false,
        theme: ThemeData
        (
          useMaterial3: true,
          appBarTheme: const AppBarTheme
          (
            centerTitle: true
          ),
          primarySwatch: Colors.blue,
        ),
        home:  const NavBar()
      ),
    );
  }
}

