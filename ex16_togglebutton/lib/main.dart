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
      home: const MyHomePage(title: 'ex16_togglebutton'),
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
  //  토글 버튼에서 사용할 버튼
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];

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
            //  여러개 선택 가능한 토글
            const Text('Multi-select', textScaleFactor: 2),
            ToggleButtons(
              //  이벤트 리스터 : 누른 버튼의 인덱스가 매개변수로 전달된다.
              onPressed: (int index) {
                setState(() {
                  //  !가 변수 앞에 있으므로 Not연산자
                  isSelected1[index] = !isSelected1[index];
                  print('isSelected1 : $isSelected1');  //  로그 확인용
                  print('index : $index');
                });
              },
              //  각 버튼의 값으로 사용할 리스트 속성
              isSelected: isSelected1,
              // 각 버튼의 아이콘을 설정
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
            ),
            const SizedBox(height: 20),
            //  한 개만 선택 가능한 토글
            const Text('single select', textScaleFactor: 2),
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  //  항목 중 하나만 선택할 수 있도록 for문으로 처리
                  for (var i=0; i<isSelected2.length; i++) {
                    if(i == index) {
                      //  선택한 항목만 활성화
                      isSelected2[i] = true;
                    } else {
                      //  반복에 의해 나머지는 비활성화
                      isSelected2[i] = false;
                    }
                  }
                  print('isSelected2 : $isSelected2');  //  로그 확인용
                });
              },
              isSelected: isSelected2,
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
