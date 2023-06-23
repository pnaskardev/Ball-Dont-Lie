import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget 
{
  final String url;
  const WebViewApp({super.key,required this.url});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> 
{
  var loadingPercentage = 0;
  late final WebViewController controller;
  @override
  void initState() 
  {
    super.initState();
    log(widget.url);
    controller=WebViewController()
    ..setNavigationDelegate
      (
        NavigationDelegate
        (
          onPageStarted: (url) 
          {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        )
      )
    ..loadRequest
    (
      Uri.parse
      (
        widget.url
      )
    );  
  }
  @override
  Widget build(BuildContext context) 
  {
    
    return SafeArea
    (
      child: Scaffold
      (
        appBar: AppBar
        (
          centerTitle: true,
          title: const Text('WebView App'),
        ),
        body:Stack
        (
          children: 
          [
            WebViewWidget
            (
              controller: controller,
              
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator
              (
                value: loadingPercentage / 100.0,
              ),
          ]
        )
      ),
    );
  }
}