import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class AddCard extends StatefulWidget {
  @override
  AddCardState createState() {
    return AddCardState();
  }
}

class AddCardState extends State<AddCard> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: WebView(
        initialUrl: '',
        gestureRecognizers: Set()
        .. add(Factory<TapGestureRecognizer>(
            () => TapGestureRecognizer()
        )),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _loadHtmlFromAssets();
        },
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/webViews/addCard.html');
    _controller.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
}
