import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  
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
    ..loadRequest(Uri.parse('http://10.0.2.2:8080/home2'));  //  https URL
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