import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key? key, required this.url}) : super(key: key);

  String url;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl:url ,
      ),
    );
  }
}
