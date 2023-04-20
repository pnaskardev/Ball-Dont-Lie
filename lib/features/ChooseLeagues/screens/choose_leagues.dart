import 'dart:developer';

import 'package:ball_dont_lie/common/navbar/navbar.dart';
import 'package:ball_dont_lie/features/ChooseLeagues/widgets/action_widget.dart';
import 'package:ball_dont_lie/features/ChooseLeagues/widgets/single_selectable_widget.dart';
import 'package:ball_dont_lie/utils/global_variables.dart';
import 'package:flutter/material.dart';


class ChooseLeagues extends StatefulWidget 
{
  const ChooseLeagues({super.key});

  @override
  State<ChooseLeagues> createState() => _ChooseLeaguesState();
}

class _ChooseLeaguesState extends State<ChooseLeagues> 
{
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _firstnameController = TextEditingController();

  @override
  void dispose() 
  {
    super.dispose();
    _firstnameController.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    var size=MediaQuery.of(context).size;
    return SafeArea
    (
      child: Scaffold
      (
        body: SingleChildScrollView
        (
          child: Center(
            child: Form
            (
              key: _formKey,
              child:Padding
              (
                padding: const EdgeInsets.all(16.0),
                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: 
                  [
                    const ListTile
                    (
                      title: Text('We need to get some information before we get started')
                    ),
                    const SizedBox
                    (
                      height: 10,
                    ),
                    TextFormField
                    (
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _firstnameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration
                      (
                        labelText: "Name",
                        errorMaxLines: 3,
                        filled: true,
                        focusedBorder: OutlineInputBorder
                        (
                          borderRadius:BorderRadius.all(Radius.circular(5)),
                        ),
                        border:  OutlineInputBorder
                        (
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide
                          (
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                   
                    const SingleSelectableWidget(),
                    const ListTile
                    (
                      title: Text('Select the leagues you wanna see standings for'),
                    ),
                    GridView.count
                    (
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List.generate(leagueHeaders.length, (index) 
                      {
                        return ActionWidget(league: leagueHeaders[index]['Items']!);
                      }),
                    )
              
                  ],
                ),
              ) 
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended
        (
          onPressed: () async
          {
            // User user=User
            // (
            //   uid: Provider.of<UserProvider>(context,listen: false).getClientId, 
            //   name: _firstnameController.text, 
            //   selectedLeags: context.read<LeagueProvider>().getList,
            //   favLeague: context.read<FavProvider>().getFav
            //   // favLeague: Provider.of<FavProvider>(context,listen: false).getFav
            // );
            try 
            {
              // await Provider.of<UserProvider>(context,listen: false).adduser(user);
              Navigator.pushReplacement
              (
                context,
                MaterialPageRoute(builder: (context)=>const NavBar()) 
              );  
            } 
            catch (e) 
            {
              log(e.toString());
              throw Exception(e);
            }
          }, 
          label: const Text('Continue'),
        ), 
      ) 
      
    );
  }
}