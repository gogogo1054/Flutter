import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  
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
    ..loadRequest(Uri.parse('http://10.0.2.2:8080/store/search'));  //  https URL
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