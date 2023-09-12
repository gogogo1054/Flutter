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
      home: const MyHomePage(title: 'Ex38_Draweruse'),
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

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  기본 슬라이딩 동작을 방지한다.
      // drawerEnableOpenDragGesture: false, //  true면 슬라이딩 된다.
      key: scaffoldKey,

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: Builder(builder: (context) => // 상황에 맞게 있는지 확인
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer()
          ),
        ),
      ),
      //  Drawer 메류를 위한 프로퍼티
      drawer: Drawer(
        //  해당 메뉴는 리스트뷰를 통해 주성한ㄷ나.
        child: ListView(
          padding: EdgeInsets.zero,
          /*
            만약 해당 위젯이 const로 선언되면 메뉴에 ontap()을
            추가했을때 에러가 발생되므로 주의해야한다.
          */
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                print('Messages 클릭');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                print('Profile 클릭');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Drawer Close'),
              onTap: (() {
                //  Drawer 닫기
                scaffoldKey.currentState!.openEndDrawer();
                // scaffold.of(context).openEndDrawer();  //  안됨
              }),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '왼쪽 끝에서 오른쪽으로 드래그해 봅니다.',
            ),
            ElevatedButton(
              child: const Text('Drawer 열기',
                style: TextStyle(fontSize: 24)),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
                // scaffold.of(context).openEndDrawer();  //  안됨
              },  
            ),
          ],
        ),
      ),
    );
  }
}
