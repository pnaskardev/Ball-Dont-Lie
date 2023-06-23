import 'dart:developer';

import 'package:ball_dont_lie/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatelessWidget 
{
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) 
  {
    // final currentTheme=Provider.of<ThemeProvider>(context,listen: false);
    return Consumer<ThemeProvider>
    (
      builder: (context,theme,child)
      {
        return Switch.adaptive
        (
          value: theme.getDarkEnabled, 
          onChanged: (bool value)
          {
            log(value.toString());
            theme.swapTheme(value);
          } 
        );
      },
      
    );
  }
}