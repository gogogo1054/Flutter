import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'ex14_checkbox_switch'),
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
  //  체크박스와 스위치문에서 사용할 전역변수(매개변수) 생성
  bool _chk1 = false;
  bool? _chk2 = false;  //  Nullable - Null값을 허용
  bool _chk3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  기본상태의 체크박스
            Checkbox(
              value: _chk1, //  체크박스에서 사용할 값 지정
              //  체크 or 언체크시 이벤트 처리
              //  위에서 Null Safety를 따로 체크를 안했기 떄문에 이곳에서 bool?을 씀
              onChanged: (bool? value) { // 이벤트 체크
                //  매개변수를 Nullable로 지정
                setState(() { //  변경 후 UI를 다시 그린다.
                  /*
                    null check operator
                      : 변수 뒤에 !을 추가하면 이 변수값이 null인 경우 runtime error가
                        발생한다.
                   */
                  _chk1 = value!;
                });
                print('Checkbox1 : $_chk1');
              }),

              Checkbox(
              value: _chk2,
              checkColor: Colors.pink,  //  체크되었을 때 마크의 색
              activeColor: Colors.green,  //  체크 되었을때 배경색
              //  노멀 상태의 배경색은 테마로 변경
              onChanged: (value) {
                //  chk2가 Nullable(bool?)로 선언되었으므로 별도의 처리가 필요없다.
                setState(() { 
                  _chk2 = value!;
                });
                print('Checkbox2 : $_chk2');
              }),

              Switch(
              value: _chk3,
              activeColor: Colors.red,  //  스위치가 켜졌을때의 색상
              activeTrackColor: Colors.cyan,  //  체크되었을때의 배경색
              inactiveThumbColor: Colors.lightGreen,  //  체크가 풀렸을때의 색상
              inactiveTrackColor: Colors.lightGreenAccent,  //  체크가 풀렸을때의 배경색
              //  스위치에서는 null값이 안 나오므로 bool? 처리를 안할경우 !실행시에도 문제생김
              onChanged: (value) {
                setState(() {
                  _chk3 = value!;
                });
                print('Switch : $_chk3');
              }
            ),
          ],
        ),
      ),
    );
  }
}
