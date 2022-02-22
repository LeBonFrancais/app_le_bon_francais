import 'package:app_le_bon_francais/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({
    Key? key,
    int? id,
  }) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BtmAppBar(),
        extendBody: true,
        body: Stack(
          children: [
            WebView(
              initialUrl: 'https://youtube.com',
              onPageStarted: (url) {
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
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ));
  }
}
