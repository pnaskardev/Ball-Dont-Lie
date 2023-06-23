import 'dart:convert';
import 'dart:developer';

import 'package:ball_dont_lie/common/navbar/navbar.dart';
import 'package:ball_dont_lie/features/ChooseLeagues/widgets/action_widget.dart';
import 'package:ball_dont_lie/providers/user_provider.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:ball_dont_lie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseLeagues extends StatefulWidget {
  const ChooseLeagues({super.key});

  @override
  State<ChooseLeagues> createState() => _ChooseLeaguesState();
}

class _ChooseLeaguesState extends State<ChooseLeagues> {
  var _isLoading = false;
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
                const ListTile(
                  title: Text('Select the leagues you wanna see standings for'),
                ),
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
          if (selectedItems.isEmpty) {
            showSnackBar(context, 'Please Select atleast one league', false);
            // return;
          }
          try {
            setState(() {
              _isLoading = true;
            });
            await Provider.of<UserProvider>(context, listen: false)
                .addLeague(context, selectedItems);
            setState(() {
              _isLoading = false;
            });
          } catch (e) {
            setState(() {
              _isLoading = false;
            });
            log(e.toString());
          } finally {
            setState(() {
              _isLoading = false;
            });
          }
        },
        label: _isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Text('Continue'),
      ),
    ));
  }
}
