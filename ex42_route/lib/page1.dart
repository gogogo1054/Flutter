import 'package:flutter/material.dart';

//  final이 아닌 하나 이상의 인스턴스 필드를 정의할때 노란줄이 보임
// ignore: must_be_immutable
class Page1 extends StatefulWidget {
  // main.dart에서 전달한 파라미터를 받기 위해 변수를 생성한 후
  //  생성자에 추가한다. 또한 required가 있으므로 필수적으로 받아야하는 값이다.
  String data = '';
  Page1({super.key, required this.data});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('2페이지 추가', style: TextStyle(fontSize: 24)),
              onPressed: () async {
                //  Route에서는 push()대신 pushNamed()(경로를 지정)를 사용한다.
                //  새로운 페이지에서 콜백데이터가 올때까지 대기(await)한다.
                //  결과 데이터를 받을 변수는 var로 선언한다. String로 받을 경우
                //  에러가 발생한다. 이미 있는 페이지를 부르기 떄문이다.
                var result = await Navigator.pushNamed(context, '/page2');
                print('result(from 2) : $result');
                //  콜백 데이터를 화면에 적용하기 위해 다시 렌더링 한다.
                setState(() {
                  //  결과 데이터를 명시적으로 String로 형변환 후 data로 설정한다.
                  widget.data = result as String;
                });
              },  
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('3페이지 추가', style: TextStyle(fontSize: 24)),
              //  동작 방식 동일. 콜백이 성공하면 then()절이 실행된다.
              onPressed: () async {
                //  변수내용 제거
                await Navigator.pushNamed(
                  context, '/page3'
                ).then((result) {
                  //  3페이지에서 콜백데이터가 정상적으로 넘어오면 then절이 실행된다.
                  //  콘솔출력 및 화면이 다시 렌더링된다.
                  print('result(from 3) : $result');
                  setState(() {
                    widget.data = result as String;
                  });
                });
              },
            ),
            //  앱 실행 초기에는 main.dart에서 전달한 '시작'이 출력된다.
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}