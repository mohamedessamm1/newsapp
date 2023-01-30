import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview_screen extends StatelessWidget {
  String? url;
  webview_screen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('akhbary', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
