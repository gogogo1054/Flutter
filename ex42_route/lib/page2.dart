import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Page2 extends StatefulWidget {
  //  파라미터를 전달받을 전역변수와 생성자 추가
  String data = '';
  Page2({super.key, required this.data});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  pop() 메서드로 페이지를 스택에서 제거하고 파라미터를 전송한다.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
                onPressed: () {
                  Navigator.pop(context, '2페이지에서 보냄 (Pop)');
              },
              child: const Text('2페이지 제거', style: TextStyle(fontSize: 24)),
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}