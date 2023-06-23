import 'dart:convert';

import 'package:ball_dont_lie/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg'],false);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error'],false);
      break;
    default:
      showSnackBar(context, response.body,false);
  }
}