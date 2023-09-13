import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      /*
        home과 initialRoute를 동시에 사용하면 home은 무시된다.
        즉 우선순위가 느리므로 동시에 사용하지 않는다.
      */
      // home: Page1(data: '시작',),  //  앱 첫 실행시 첫 페이지를 지정
      initialRoute: '/page1', //  첫번쨰 페이지 보여주기
      //  각각의 페이지를 생성자 호출을 통ㅌ해 지정
      //  이름을 미리 만들어 놓는 것을 route라고 한다.
      routes: { //  순서, 방향, 각 페이지를 생성자 호출을 통해 지정
        //  data라는 파라미터에 '시작'값을 전달한다.
        //  쓰는 경우가 있으므로 알아두면 좋음
        '/page1' : (context) => Page1(data: '시작'),  //  불러지는 값
        '/page2' : (context) => Page2(data: '1페이지에서 보냄 (1->2)'),
        '/page3' : (context) => Page3(data: '1페이지에서 보냄 (1->3)'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
