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
      home: const MyHomePage(title: 'Ex28_Listview3'),
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

  //  나중에 초기화 될것임을 명시.  데이터로 사용할 컬렉션
  late List<Person> persons;

  //  위젯 초기화시 딱 한 번만 호출되는 함수로 변경했을때 Hot reload가
  //  지원되지 않으므로 재시작해야한다.
  @override
  void initState() {
    super.initState();  //  must call in 2.0 ~

    persons = []; //  초기화
    //  데이터로 사용하기 위한 반복
    for(int i=0; i<15; i++) {
      persons.add(Person(i+21, '홍길동$i', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: 
      //  ListView.separated를 사용해서 Lazy하게 생성.
      //  아이템 사이에 구분자도 Lazy하게 생성.
      ListView.separated(
        padding: const EdgeInsets.all(8),
        //  컬렉션에 저장된 아이템의 개수만큼 알아서 반복한다.
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index) {
          // Person 객체 외에 추가데이터은 index를 사용한다.
          return PersonTile(persons[index], index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider( //  구분선
            color: Colors.black,  //  Colors.transparent
            height: 1,  //  구분선은 해당 속성에 따라 다른 결과를 출력한다.
            // thickness: 1.0,
          );
        },
      ),
    );
  }
}

//  데이터로 사용할 클래스 ==========================================================
class Person {
  int age;
  String name;
  bool isLefthand;

  Person(this.age, this.name, this.isLefthand); //  생성자
}

//  PersonTile 정의 ==================================================================
/*
  StatelessWidget클래스는 build()메서드를 가지고 있다. build메서드는
  위젯을 생성할 때 호출되는데,  실제로 화면에 그릴 위젯을 작성해 반환한다.
  따라서 StatelessWidget클래스를 상속 받은 PersonTile클래스는
  ListTile클래스에 인스턴스를 작성해서 반환한다.
*/
class PersonTile extends StatelessWidget {
  //  멤버변수와 생성자 정의
  final Person _person;
  final int index;  //  타일에 추가 데이터가 필요한 경우 생성자에 추가하면 된다.
  const PersonTile(this._person, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: ListTile(
        /*
          리스트타일에 배경색을 부여하고 싶을때는 container로 감싼 후 (Crrl + .)
        */
        leading: const Icon(Icons.person),
        title: Text(_person.name),
        subtitle: Text("${_person.age}세"),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          print('추가 데이터 : $index');
        },
      ),
    );
  }
}


