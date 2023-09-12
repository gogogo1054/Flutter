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
      home: const MyHomePage(title: 'Ex29_Listview4'),
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
      body: Container(
        margin: const EdgeInsets.all(0.0),
        padding: const EdgeInsets.all(0.0),
        // width: 250,   //  크기를 지정하지 않으면 자식의 크기
        // height: 250,  //  크기를 지정하지 않으면 부모의 크기
                      //  화면 크기보다 자식이 크면 화면의 크기
        child: ListView(
          children: [
            Container(
              width: double.infinity, //  like Match_parent in Android
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[700],
              child: const Text('Entry A', style: TextStyle(fontSize: 30)),
            ),
            //  2.  ListView.builder를 사용해서 생성
            SizedBox(
              width: double.infinity,
              height: 200,
              //  빌더를 통해 가로형 리스트뷰를 출력
              child: ListView.builder(
                //  스크롤 방향을 수평방향으로 설정
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: persons.length,
                itemBuilder: (BuildContext context, int index) {
                  return PersonTile(persons[index], index);
                }  
              ),
            ),

           Container(
              width: double.infinity, //  like Match_parent in Android
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[500],
              child: const Text('Entry B', style: TextStyle(fontSize: 30)),
            ),

            Container(
              width: double.infinity, //  like Match_parent in Android
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[300],
              child: const Text('Entry C', style: TextStyle(fontSize: 30)),
            ),

            Container(
              width: double.infinity, //  like Match_parent in Android
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[100],
              child: const Text('Entry D', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
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
    //  리스트 타일 대신 카드를 사용한다.
    return Card(
      color: Colors.amber[100], //  배경색
      elevation: 0,
      //  카드의 테두리 속성(색깔, 두께, 원형적용)
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        splashColor: Colors.blue, //  클릭했을때 변하는 색깔
        onTap: () {
          print('$index번 타일 클릭됨');
        },
      child: SizedBox(
            width: 140,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity, //  like Match_parent in Android
                  height: 100,
                  alignment: Alignment.center,
                  color: Colors.blue[50],
                  child: Column(
                    children: [
                      Text( //  이름
                        _person.name,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                Text( //  나이
                  "${_person.age}세",
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
            ElevatedButton( 
              child: const Text('ElevatedButton',
              style: TextStyle(fontSize: 13)),
              onPressed: () => _onClick(index),
            ),
          ],
        ),
      ),
    ),
  );
}
  void _onClick(int index) {
    print('$index 클릭됨');
  }
}


