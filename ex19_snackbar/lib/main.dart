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
      home: const MyHomePage(title: 'ex19_snackbar'),
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
  //  toast보다 스택바를 사용하는 것이 좋다.
  String msg = "Hello world";

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
          children: <Widget>[
            ElevatedButton(
              child: const Text('SnackBar 기본',
                style: TextStyle(fontSize: 24)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  //  SnackBar 구현하는 법 context는 위의 BuildContext에 있는
                  //  객체를 그대로 가져온다.
                  SnackBar(
                    //  SnackBar의 내용. icon, button같은 것도 가능하다.
                    content: Text(msg), //  메세지 내용
                    duration: const Duration(milliseconds: 5000), //  스낵바가 닫히는 시간
                    //  추가로 작업 넣기. 버튼 넣기라 생각하면 됨.
                    action: SnackBarAction(
                      label: 'Undo',  //  버튼 이름
                      onPressed: (){},  //  함수
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text('SnackBar 옵션',
                style: TextStyle(fontSize: 24)),
              onPressed: () => callSnackbar("안녕하세요~ 홍길동님!"),    
            ),
          ],
        ),
      ),
    );
  }
  callSnackbar(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg,  //  메세지 스타일
          style: const TextStyle(
            color: Colors.black,
          )),
          backgroundColor: Colors.yellow[800],  //  배경색
          duration: const Duration(milliseconds: 5000), //  닫히는 시간
          //  스낵바에 별도의 텍스트 버튼을 추가할 수 있다.
          action: SnackBarAction(
            label: 'Exit',  
            textColor: Colors.black,
            onPressed: () {},
          ),
          behavior: SnackBarBehavior.floating,  //  플로팅(아래쪽 부분에서 띄움)
          shape: RoundedRectangleBorder(  //  스낵바의 모양을 커스텀할 수 있다.
            //  모서리를 약간 둥글게 처리함.
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.red,
              width: 2,
          ),
        ),
      ),
    );
  }
}
