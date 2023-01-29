import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget 
{
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AutomaticKeepAliveClientMixin<SettingsPage>
{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) 
  {
    super.build(context);
    return const SafeArea
    (
      child: Scaffold
      (
        body: Center
        (
          child: Text('Settings Page')
        ),
      ),
    );
  }
}