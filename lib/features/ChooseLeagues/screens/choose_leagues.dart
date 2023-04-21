import 'dart:developer';

import 'package:ball_dont_lie/common/navbar/navbar.dart';
import 'package:ball_dont_lie/features/ChooseLeagues/widgets/action_widget.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:flutter/material.dart';

class ChooseLeagues extends StatefulWidget {
  const ChooseLeagues({super.key});

  @override
  State<ChooseLeagues> createState() => _ChooseLeaguesState();
}

class _ChooseLeaguesState extends State<ChooseLeagues> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<String> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ListTile(
                    title: Text(
                        'We need to get some information before we get started')),
                const SizedBox(
                  height: 20,
                ),
                // const ListTile
                // (
                //   title: Text('Select you fav league'),
                // ),
                // const SingleSelectableWidget(),
                const ListTile(
                  title: Text('Select the leagues you wanna see standings for'),
                ),
                // GridView.count
                // (
                //   physics: const NeverScrollableScrollPhysics(),
                //   crossAxisCount: 2,
                //   shrinkWrap: true,
                //   children: List.generate(leagueHeaders.length, (index)
                //   {
                //     return ActionWidget(league: leagueHeaders[index]['Items']!);
                //   }),
                // )
                SizedBox(
                  height: size.height * 0.6,
                  child: ListView.builder(
                    itemCount: leagueHeaders.length,
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 5,
                          child: ActionWidget(
                              leagueHeaders: leagueHeaders,
                              index: index,
                              selectedItems: selectedItems));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          print(selectedItems);
          // try
          // {
          //   // await Provider.of<UserProvider>(context,listen: false).adduser(user);
          //   Navigator.pushReplacement
          //   (
          //     context,
          //     MaterialPageRoute(builder: (context)=>const NavBar())
          //   );
          // }
          // catch (e)
          // {
          //   log(e.toString());
          //   throw Exception(e);
          // }
        },
        label: const Text('Continue'),
      ),
    ));
  }
}
