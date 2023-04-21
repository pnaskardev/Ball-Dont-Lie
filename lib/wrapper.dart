import 'package:ball_dont_lie/common/navbar/navbar.dart';
import 'package:ball_dont_lie/features/ChooseLeagues/screens/choose_leagues.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});
  static const routeName = '/wrapper';
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isData = false;
  bool isLoading = true;

  void initiate() async {}

  @override
  void initState() {
    super.initState();
    initiate();
  }

  @override
  Widget build(BuildContext context) {
    // if (Provider.of<UserProvider>(context, listen: true)
    //     .user
    //     .selectedLeagues
    //     .isEmpty) {
    //   return const ChooseLeagues();
    // }
    // return const NavBar();
    return Consumer<UserProvider>(builder: (context, data, child) {
      return data.user.selectedLeagues.isEmpty
          ? const ChooseLeagues()
          : const NavBar();
    });
  }
}
