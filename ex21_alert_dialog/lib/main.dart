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
      home: const MyHomePage(title: 'ex21_alert_dialog'),
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
  
  String _sPersonName = '';

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
            ElevatedButton(
              child: const Text('show AlertDialog',
                style: TextStyle(fontSize: 24)),
              onPressed: () => _showAlertDialog(context, 'hello~'),
            ),
          ],
        ),
      ),
    );
  }
  
  //  void showAlertDialog() async {  //  Future가 있어야 한다.
  Future _showAlertDialog(BuildContext context, String message) async {

    await showDialog(
      context: context, 
      /*
        화면의 빈곳을 눌러도 창이 닫히지 않음
        true인 경우에는 창이 닫히게 된다.
      */
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.orange), 
          child: AlertDialog(
            //  모서리 부분을 라운드 처리
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
            title: const Text('AlertDialog Example'),
            content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text(message),
                  TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      //  입력상자의 힌트 설정
                      labelText: 'Name', hintText: '홍길동'),
                      onChanged: (value) {
                        _sPersonName = value;
                      },
                    )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  //  버튼을 누르면 대화창을 닫는다.
                  Navigator.pop(context, 'OK');
                  //  입력된 내용을 콘솔에 출력한다.
                  print('OK - $_sPersonName');
                },
              ),
               ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  //  버튼을 누르면 대화창을 닫는다.
                  Navigator.pop(context, 'Cancel');
                  //  입력된 내용을 콘솔에 출력한다.
                  print('Cancel');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
