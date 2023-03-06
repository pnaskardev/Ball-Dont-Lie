import 'package:ball_dont_lie/features/Settings/widgets/change_theme_button.dart';
import 'package:ball_dont_lie/features/Settings/widgets/profile_widget.dart';
import 'package:ball_dont_lie/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/cards/neopop_card.dart';
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
        appBar: AppBar
        (
          centerTitle: true,
          title: const Text('Settings'),

        ),
        body: Center
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: 
            [
              ListTile
              (
                // leading: Icon(Icons.dark_mode),
                leading: Provider.of<ThemeProvider>(context).getDarkEnabled ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
                title: const Text('Change theme'),
                trailing: const ChangeThemeButton()
              ),
              const ListTile
              (
                title: ProfileWidget()
              ),
              const ListTile
              (
                title: NeoPopCard
                (
                  color: Colors.white24,
                  borderColor:Colors.black,
                  depth: 10,
                  hShadowColor: Colors.purpleAccent,
                  vShadowColor: Colors.deepPurpleAccent,
                  child: SizedBox
                  (
                    height: 100,
                    child: Center
                    (
                      child: Padding
                      (
                        padding: EdgeInsets.all(16.0),
                        child: Text
                        (
                          'More features and Settings coming soon',
                          style: TextStyle
                          (
                            color: Colors.blueGrey
                          ),
                        ),
                      ),
                    ),
                  )
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}