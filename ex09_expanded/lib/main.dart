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
      home: const MyHomePage(title: 'Ex09_Expanded'),
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
  // String _image1 = 'assets/images/900.png';
  String _image1 = 'assets/images/900x600.png';
  String _image2 = 'assets/images/placeholder.png';
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          //  세로형 배치
          mainAxisAlignment: MainAxisAlignment.start, //  위에서 부터 배치
          children: [
            Expanded(
              flex: 5,  //  HTML5의 %와 유사한 속성으로 위젯의 비율을 설정. 10개의 기준이 있음
              child: Container(
                margin: const EdgeInsets.all(0.0),  //  마진 - 바깥쪽 여백
                padding: const EdgeInsets.all(0.0), //  패딩 - 안쪽 여백
                color: Colors.cyan, //  배경색
                alignment: Alignment.topLeft,
                child: Image.asset(
                  _image1,
                  alignment: Alignment.topLeft,
                  // alignment: Alignment.topCenter,
                  // alignment: Alignment.bottomRight,
                  // fit: BoxFit.none,  //  주석 처리하면 사진 원본크기로 출력
                  width: 390.0,
                  height: 250.0,
                ),
              ),
            ),

            Container(
                margin: const EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 10),
                padding: const EdgeInsets.all(0.0),
                color: Colors.white,
                // width: 300,  //  크기를 지정하지 않으면 부모 크기
                // height: 100, //  크기를 지정하지 않으면 자식 크기
                // alignment: Alignment.center,
                child: Row( //  가로형 배치
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.upload_sharp),
                      tooltip: "이미지 위로 이동",
                      iconSize: 50.0,
                      onPressed: () => _onClick1(), //  람다 형식의 호출
                    ),
                    //  수평방향으로 간격 설정, 사이 간격을 줄 때 많이 사용한다.
                    const SizedBox(width: 20,),
                    IconButton(
                      icon: const Icon(Icons.download_sharp),
                      tooltip: "이미지 아래로 이동",
                      iconSize: 50.0,
                      onPressed: () => _onClick2(), //  람다 형식의 호출
                    ),
                  ],
                ),
              ),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(0.0),
                color: Colors.cyan,
                alignment: Alignment.topLeft,
                child: Image.asset( //  image asset시 재실행
                  _image2,
                  alignment: Alignment.topLeft,
                  // fit: BoxFit.none,  //  주석 처리 시 원본 크기 출력
                  width: 390.0,
                  height: 250.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _onClick1() {
    /*
      상태 변경을 위해 사용하는 메서드로 특정 변수를 변경시키게 되면
      화면의 렌더링이 다시 진행되면서 변경된 화면을 볼 수 있게 된다.
    */
    setState(() {
      // _image1 = 'assets/images/900.png';
      _image1 = 'assets/images/900x600.png';  //  image3을 사용할 때
      _image2 = 'assets/images/placeholder.png';  //  1바이트 투명 이미지
    });
  }
  
  void _onClick2() {
    setState(() {
      _image1 = 'assets/images/placeholder.png';
      // _image2 = 'assets/images/900.png';
      _image2 = 'assets/images/900x600.png';  //  image3을 사용할 때
    });
  }



}

