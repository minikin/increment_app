import 'dart:async';

import 'package:flutter/material.dart';
import 'package:increment_app/src/utils/responsive_safe_area.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Increment'),
      ),
      body: ResponsiveSafeArea(builder: (context, size) {
        return WebView(
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          initialUrl: 'https://increment.com/',
          onWebViewCreated: (webViewController) {
            print(_controller.isCompleted);
            _controller.complete(webViewController);
          },
        );
      }),
    );
  }
}
