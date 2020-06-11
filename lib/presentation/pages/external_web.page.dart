import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExternalWebPage extends StatelessWidget {
  final String url;
  final String title;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  ExternalWebPage({
    Key key,
    @required this.url,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      );
}
