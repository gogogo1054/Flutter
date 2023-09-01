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
        // useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Ex02 Start 02'),
      home: Scaffold(
        appBar:AppBar(
          backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          title: const Text('Example Title'),
          //  const 상수로 정의하면 화면을 더이상 그리지 않음 
          //  const가 붙으면 상태가 변하지 않으므로 정보가 변하지 않는다.
          //  속도가 빨라진다. (배터리 낭비 방지)
          //  나중에 바꾸려면 const를 붙이지 않는다.
          //  자동 완성에서 알려주는 방법이 최선은 아니다.
          //  모바일은 초당 60프레임 즉 화면이 60번 깜빡일때까지
          //  화면이 변하지 않으면 배터리가 절약이 된다.
          ),
          body: const Center(
          child: Text('Example Body',
          style:TextStyle(fontSize: 30),
          ),
          ),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

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
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
