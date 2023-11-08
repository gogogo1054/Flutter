import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPage();
}

class _ViewPage extends State<ViewPage> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..addJavaScriptChannel(
      "JsFlutter", 
      onMessageReceived: (JavaScriptMessage message) {
        ScaffoldMessenger
        .of(context)
        .showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      }
    )
    ..loadRequest(Uri.parse('http://10.0.2.2:8080/login'));  //  https URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
