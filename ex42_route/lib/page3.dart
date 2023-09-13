import 'package:flutter/material.dart';

//  신경쓰지 말라는 주석 - 노란줄에 빠른 수정하면 됨
// ignore: must_be_immutable
class Page3 extends StatefulWidget {
  String data = '';
  Page3({super.key, required this.data});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
                onPressed: () {
                  Navigator.pop(context, '3페이지에서 보냄 (Pop)');
              },
              child: const Text('3페이지 제거', style: TextStyle(fontSize: 24)),
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}