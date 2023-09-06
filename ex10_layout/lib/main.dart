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
      home: const MyHomePage(title: 'Ex10_Layout'),
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
      /*
        위젯을 감쌀 필요가 있는 경우 ctrl + . 을 사용한다.
      */ 
      body: SafeArea( //  하단이 라운드형인 핸드폰이 있을떄 사용
        child: Container(
          color: Colors.orange, //  하단의 margin 확인용
          child: Column(  //  세로형 배치
            children: [
              
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow, //  컨테이너 크기 확인용
                  width: 300,
                  height: 100,
                  child: Row( //  가로형 배치
                    mainAxisAlignment: MainAxisAlignment.center,  //  가운데 정렬
                    mainAxisSize: MainAxisSize.max,
                    //  child : 1개 이상의 위젯을 배치할 때 사용
                    //  children : 2개 이상의 위젯을 배치할 때 사용
                    children: [ 
                      ElevatedButton(
                        child : const Text('Button'),
                        onPressed: () {},
                      ),
                      // const SizedBox(width: 10,),  //  위젯 사이의 간격 조정
                      // const Spacer(flex: 1,),  //  위젯의 전체적인 배치 조정, 비율
                      ElevatedButton(
                        child : const Text('Button'),
                        onPressed: () {},
                      ),
                      // const SizedBox(width: 10,),
                      // const Spacer(flex: 1,),
                      ElevatedButton(
                        child : const Text('Button'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
        
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.cyan, //  컨테이너 크기 확인용
                  width: 300,
                  height: 100,
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row( //  가로형 배치
                    //  수직 방향에서 하단 정렬
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        child : const Text('Button'),
                        onPressed: () {},
                      ),
                      // const SizedBox(width: 10,),
                      // const Spacer(flex: 1,),
                      ElevatedButton(
                        child : const Text('Button'),
                        onPressed: () {},
                      ),
                      // const SizedBox(width: 10,),
                      // const Spacer(flex: 1,),
                      ElevatedButton(
                        child : const Text('Button'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
