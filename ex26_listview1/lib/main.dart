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
      home: const MyHomePage(title: 'Ex26_Listview1'),
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
      //  1.  명시적으로 ListView의 children으로 List를 넘겨서 실행
      body: ListView(
        // children: <Widget>[
        //   //  하나의 항목을 ListTile로 표현한다.
        //   ListTile(
        //     //  좌측 아이콘, 왼쪽을 담당
        //     leading: const FlutterLogo(
        //       size: 50.0,
        //     ),
        //     //  타일에 출력할 제목, 중앙을 담당
        //     title: const Text('Basic #1'),
        //     //  출력할 내용
        //     subtitle: const Text('타이틀과 서브 타이틀로만 구성'),
        //     //  우측의 아이콘, 오른쪽을 담당
        //     trailing: const Icon(Icons.more_vert),
        //     onTap: () {
        //       print('Basic #1');
        //     },
        //   ),
        // ],
        // children: getMyList1(),
        children: getMyList2(),
      ),
    );
  }
  
  // //  메서드의 리턴값으로 Scaffold의 body구성
  // List<Widget> getMyList1() {
  //   List<Widget> myList = [
  //     ListTile(
  //       leading: const FlutterLogo(
  //         size: 50.0,
  //       ),
  //       title: const Text('Basic #1'),
  //       subtitle: const Text('타이틀과 서브타이틀로만 구성'),
  //       trailing: const Icon(Icons.more_vert),
  //       onTap: () {
  //         print('Basic #1');
  //       },
  //     ),
  //     const Divider(  //  명확한 구분을 위해 이 구분선을 사용함
  //       color: Colors.black,
  //       height: 5,
  //       // indent: 10, //  구분선 앞 공강
  //       // endIndent: 10,  //  구분선 뒤 공간
  //     )
  //   ];
  //   return myList;
  // }
  //  메서드의 리턴값으로 Scaffold의 body구성
  getMyList2() {

    //임의의 데이터값
    List<Person> persons = [];
    for(int i=0; i<15; i++) {
      persons.add(Person(i+21, '홍길동$i',true));
    }

    //  데이터를 이용하여 리스트 생성
    List<Widget> myList = [];
    for(int i=0; i<persons.length; i++) {
      Widget wid = ListTile(
        leading: const FlutterLogo(
          size: 50.0,
        ),
        title: Text('Basic #$i'),
        subtitle: Text('${persons[i].name} - ${persons[i].age}'),
        trailing: const Icon(Icons.more_vert),
        onTap: () {
          print('Basic #$i');
        },
      );
      myList.add(wid);
    }
    return myList;
  }
}

//  데이터로 사용할 클래스
class Person {
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);
}