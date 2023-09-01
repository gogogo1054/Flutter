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
      home: const MyHomePage(title: 'Ex04_Icon'),
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
      body: const Row(  //  아이콘은 상수이기 때문에 아래 모두 상수처리하지 말고
                  //  여기서 상수처리하면 된다.
        children: <Widget>[ 
          //  우리가 만들고 자동으로 완성된 코드에는 앞에 있는 <Widget>이 없다
          //  없어도 된다는 의미
          Icon(
            Icons.camera_alt,
            color: Colors.red,
            size: 35.0,
          ),
          Icon(
            Icons.cancel,
            color: Colors.orange,
            size: 35.0,
          ),
          //////////////////////////////////////////////////////////////////////////
          Icon( //  시계
            Icons.access_time_sharp ,
            color: Colors.black,
            size: 35.0,
          ),
          Icon( //  회원
            Icons.account_circle_rounded ,
            color: Colors.black54,
            size: 35.0,
          ),
          Icon( //  길찾기
            Icons.assistant_navigation ,
            color: Colors.blue,
            size: 35.0,
          ),
          Icon( //  마커
            Icons.fmd_good_sharp ,
            color: Colors.blue,
            size: 35.0,
          ),
          Icon( //  블락
            Icons.block ,
            color: Colors.red,
            size: 35.0,
          ),
          Icon( //  체크
            Icons.check_circle_sharp ,
            color: Colors.blue,
            size: 35.0,
          ),
          Icon( //  에러
            Icons.error_sharp ,
            color: Colors.red,
            size: 35.0,
          ),
          Icon( //  에러
            Icons.favorite_outlined  ,
            color: Colors.pink,
            size: 35.0,
          ),
          Icon( //  폴더
            Icons.folder  ,
            color: Colors.orange,
            size: 35.0,
          ),
          Icon( //  다운
            Icons.get_app  ,
            color: Colors.black,
            size: 10.0,
          ),
        ],
      ),
    );
  }
}
