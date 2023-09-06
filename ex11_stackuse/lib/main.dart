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
      home: const MyHomePage(title: 'Ex11_Stackuse'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getStack1(),
            const SizedBox(height: 10,),
            getStack2(),
            const SizedBox(height: 10,),
            getStack3(),
            const SizedBox(height: 10,),
            getStack4(),
          ],
        ),
      ),
    );
  }
}

Widget getStack1() {
  return Stack(
    // fit: StackFit.expand,
    // alignment: AlignmentDirectional.bottomCenter,
    children: [
      Container(
        width: 120,
        height: 120,
        color: Colors.red,
      ),

      Container(  //  크기만 지정 시 좌측 상단이 시작지점(파란네모)
                  //  alignment 주석 처리하면 알 수 있음
        width: 60,
        height: 60,
        color: Colors.blue,
      ),
    ],
  );
}

Widget getStack2() {
  return Stack(
    // fit: StackFit.expand,
    // alignment: AlignmentDirectional.bottomCenter,
    children: [
      Container(
        width: 120,
        height: 120,
        color: Colors.red,
      ),

      Positioned( //  시작 위치를 변경할 때 사용
        top: 30,
        left: 30,
        child: Container(
          width: 60,
          height: 60,
          color: Colors.blue,
        ),
      ),
    ],
  );
}

Widget getStack3() {
  return Stack(
    // fit: StackFit.expand,
    // alignment: AlignmentDirectional.bottomCenter,
    children: [
      Container(
        width: 120,
        height: 120,
        color: Colors.red,
      ),

      Positioned( //  시작 위치를 변경할 때 사용
        top: 30,
        left: 30,
        //  하단의 Container의 크기가 무시된다. 위 네모보다 큰 크기는 잘림
        width: 120,
        height: 120,
        child: Container(
          width: 60,
          height: 60,
          color: Colors.blue,
        ),
      ),
    ],
  );
}

Widget getStack4() {
  return Stack(
    clipBehavior: Clip.none,  //  기본형은 hardEdge
    // fit: StackFit.expand,
    // alignment: AlignmentDirectional.bottomCenter,
    children: [
      Container(
        width: 120,
        height: 120,
        color: Colors.red,
      ),

      Positioned( //  시작 위치를 변경할 때 사용
        top: 30,
        left: 30,
        //  하단의 Container의 크기가 무시된다. 위 네모보다 큰 크기는 잘림
        //  ClipBehavior로 잘린형태가 아닌 전체를 표현 할 수 있다.
        width: 120,
        height: 120,
        child: Container(
          width: 60,
          height: 60,
          color: Colors.blue,
        ),
      ),
    ],
  );
}
