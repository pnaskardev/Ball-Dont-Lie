import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text,bool success) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),backgroundColor: success?Colors.green:Colors.redAccent,));
}