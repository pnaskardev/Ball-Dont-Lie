import 'package:ball_dont_lie/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/cards/neopop_card.dart';

class NeopopCardGlobal extends StatelessWidget {
   NeopopCardGlobal({super.key,required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return NeoPopCard(
      color: Colors.white30,
      borderColor: Colors.black,
      vShadowColor: Colors.deepPurpleAccent,
      hShadowColor: Colors.purpleAccent,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: Styles.tabStyle,
        ),
      ),
    );
  }
}
