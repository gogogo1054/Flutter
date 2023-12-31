import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';  //  의존성 추가할때 버전넣어줄것

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
      home: const MyHomePage(title: 'Ex57_Sqlite1'),
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

  // sqflite 사용을 위한 데이터베이스 객체 생성
  late Future<Database> database;
  int seqNum = 0;
  //  텍스트필드에 입력된 내용을 얻어오기 위한 컨트롤러
  final ctlMyText1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    //  앱이 최초 시작될때 데이트베이스 생성
    createDatabase();
  }

  void createDatabase() async {
    database = openDatabase(
      //  각 플랫폼 별로 데이터베이스 경로 설정
      //  'path' 패키지의 'join' 함수를 사용
      join(await getDatabasesPath(), 'telbook db'),
      //  데이터베이스가 처음 생성될 때, 테이블 생성.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE telbook(id INTEGER PRIMARY KEY, name TEXT, telnum TEXT)",
        );
      },
      //  onCreate 함수에 DB업그레이드와 다운그레이드를 위한 경로 제공
      version: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(  //  키보드 오버플로우 방지
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Insert',
                  style: TextStyle(fontSize: 24)),
                onPressed: () => doInsert(),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('Select All',
                  style: TextStyle(fontSize: 24)),
                onPressed: () => doSelectAll(),
              ),
              const SizedBox(height: 10,),
              SizedBox( //  TextField의 너비를 외부에서 지정)
              width: 240,
              child: TextField(
                controller: ctlMyText1,
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('Select One',
                  style: TextStyle(fontSize: 24)),
                onPressed: () {
                  //  텍스트필드에 입력된 내용을 얻어온다.
                  var sNum = ctlMyText1.text;
                  int nNum = int.parse(sNum);
                  doSelectOne(nNum);
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('Update',
                  style: TextStyle(fontSize: 24)),
                onPressed: () {
                  var sNum = ctlMyText1.text;
                  int nNum = int.parse(sNum);
                  doUpdate(nNum);
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('Delete',
                  style: TextStyle(fontSize: 24)),
                onPressed: () {
                  var sNum = ctlMyText1.text;
                  int nNum = int.parse(sNum);
                  doDelete(nNum);
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('Delete All',
                  style: TextStyle(fontSize: 24)),
                onPressed: () => doDeleteAll(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  전체 레코드 조회
  void doSelectAll() async {
    //  데이터베이스 reference를 얻기
    final Database db = await database;
    //  select한 결과를 List로 반환
    List<Map> datas = await db.rawQuery('select * from telbook');
    /*
      컬렉션에 어떤 것이 포함되어 있는지 확인하기 위해 호출 length하는 것은
      매우 느릴 수 있다. 대신 더 빠르고 더 읽기 쉬운 게터가 존재한다.
      isEmpty 및 isNotEmpty(부정할때). 결과를 부정할 필요가 없는것을 사용하면 된다.
      하단 data.length에서 파란밑줄이 생기는 이유
    */
    // if (datas.isNotEmpty) {
    if (datas.length > 0) { //  datas.isNotEmpty로 사용을 권장
      for(int i=0; i<datas.length; i++) {
        //  각 레코드는 인덱스i를 통해 접근하여 컬럼명으로 값을 얻어온다.
        int id = datas[i]['id'];
        String name = datas[i]['name'];
        String telnum = datas[i]['telnum'];

        print('$id $name $telnum');
      }
    } else {
      print('SelectAll : 데이터가 없습니다.');
    }
  }

  //  하나의 레코드 조회
  void doSelectOne(int num) async {
    //  데이터베이스 reference를 얻기
    final Database db = await database;

    List<Map> data = await db.rawQuery('select * from telbook where id = $num');
    if (data.length > 0) {
      for(int i=0; i<data.length; i++) {
        int id = data[0]['id'];
        String name = data[0]['name'];
        String telnum = data[0]['telnum'];

        print('$id $name $telnum');
      }
    } else {
      print('SelectOne : 데이터가 없습니다.');
    }
  }

  //  새로운 레코드 입력
  Future<void> doInsert() async {
    final Database db = await database;

    //  시퀀스로 사용할 변수
    seqNum = seqNum + 1;
    var telnum = '010-1234-$seqNum$seqNum$seqNum$seqNum';

    //  쿼리문은 인파라미터 ? 가 있는 형태로 작성한다.
    int count = await db.rawInsert(
      'insert into telbook (id, name, telnum) values (?, ?, ?)',
      [seqNum, '홍길동$seqNum', telnum]);
    print('Insert : $count');
  }

  //  레코드 업데이트 (데이터 변경)
  Future<void> doUpdate(int id) async {
    final db = await database;

    int count = await db.rawUpdate(
      'update telbook set name = ?, telnum = ? where id = ?',
      ['손오공', '010-1234-xxxx', id]);
    print('Update : $count');
  }

  //  레코드 삭제
  Future<void> doDelete(int id) async {
    final db = await database;
   int count = await db.rawDelete(
      'delete from telbook where id = ?', [id]);
    print('Delete : $count');
  }

  //  전체 레코드 삭제
  Future<void> doDeleteAll() async {
    final db = await database;
    int count = await db.rawDelete('delete from telbook');
    print('DeleteAll : $count');
  }

}
