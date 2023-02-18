import 'package:ball_dont_lie/features/Settings/widgets/change_theme_button.dart';
import 'package:ball_dont_lie/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return SafeArea
    (
      child: Scaffold
      (
        body: Center
        (
          child: ListTile
          (
            // leading: Icon(Icons.dark_mode),
            leading: Provider.of<ThemeProvider>(context).getDarkEnabled ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
            title: const Text('Change theme'),
            trailing: const ChangeThemeButton()
          )
        ),
      ),
    );
  }
}