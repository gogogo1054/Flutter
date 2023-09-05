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
      home: const MyHomePage(title: 'Ex08_Container'),
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
          //  상단부터 위젯을 배치한다는 의미
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //  4방향으로 마진이나 패딩을 적용한다.
              //  margin : const EdgeInsets.all(10.0),
              //  지정한 방향에만 적용한다.
              margin: const EdgeInsets.only(left: 10, top: 10),
              padding: const EdgeInsets.all(0.0),
              color: Colors.yellow,  //  색을 지정하지 않으면 컨테이너의 크기를 알 수 없다.
              //  width: 300, //  너비 크기를 지정하지 않으면 부모의 크기
              height: 100,  //  높이 크기를 지정하지 않으면 자식의 크기
              alignment: Alignment.topLeft,
              child: const Text(
                '홍길동',
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(80.0),  //  자식과의 패딩으로 크기가 정해짐
              alignment: Alignment.center,
              //  컨테이너의 모양을 결정하는 속성
              decoration: const BoxDecoration(
                shape: BoxShape.circle, //  원 모양으로 결정
                color: Colors.blue,
              ),
              child: const Text(
                '전우치',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
              width: 500, //  크기를 지정하지 않거나 초과하면 부모의 크기
              height: 100,  //  크기를 지정하지 않으면 자식의 크기
              alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,  //  사각형 모양으로 결정
                color: Colors.brown,
              ),
              child: const Text(
                '손오공',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),

            const SizedBox(height: 5,),

            //  컨테이너에 이미지를 데코레이션으로 삽입
            Container(
              width: 100,
              height: 60,
              //  라운드 형태로도 만들 수 있음. 모양 변경 가능
              decoration: const BoxDecoration(  //  상태창 꾸미기
                image: DecorationImage(
                  image: AssetImage('assets/images/300x100.png')
                ),
              ),
              //  텍스트 버튼으로 마치 이미지 버튼과 같은 효과를 적용한다.
              child: TextButton(
                child: const Text('',),
                onPressed: () => _onClick(1),
              ),
            ),

            Ink.image(
              //  전체 이미지 변경
              image: const AssetImage('assets/images/300x100.png'),
              width: 100.0,
              height: 40.0,
              //  fit: BoxFit.fill,
              //  해당 위젯은 onTap으로 클릭 설정을 한다.
              child: InkWell(
                //  chile: Text(''),
                onTap: () => _onClick(2),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onClick(int num) {
    print('Hello~ $num');
  }
}
