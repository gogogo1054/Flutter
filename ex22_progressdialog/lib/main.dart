import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

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
      home: const MyHomePage(title: 'Ex22_Progressdialog'),
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

Future _normalProgress(context) async { // sn_progress_dialog 1.0.8
    /// Create progress dialog
    ProgressDialog pd = ProgressDialog(context: context);


    /// Set options
    /// Max and msg required
    pd.show(  // sn_progress_dialog 1.1.3
      max: 100,
      msg: 'File Downloading...',
      progressBgColor: Colors.transparent,
    );
    for (int i = 0; i <= 100; i++) {
      pd.update(value: i);
      i++;
      await Future.delayed(const Duration(milliseconds: 100));  // 속도
    }
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
            ElevatedButton(
              child: const Text('Show ProgressDialog',
                style: TextStyle(fontSize: 24)),
              onPressed: () => _showProgressDialog('loading...'),
            ),
            MaterialButton( // sn_progress_dialog 1.1.3
              color: const Color(0xfff7f7f7),
              child: const Text('Normal Progress'),
              onPressed: () {
                _normalProgress(context);
            }),
          ],
        ),
      ),
    );
  }
  
  Future _showProgressDialog(String message) async {
    await showDialog(
      context: context, 
      //  화면의 빈부분을 눌렀을때 종료 된다.
      barrierDismissible: true, //  false : user must tap button
      builder: (BuildContext context) {
        //  테스트할 때 3초 후 창닫기
        Future.delayed(const Duration(seconds: 3), () {
          //  작업 완려 시(로그인 등) 아래 명령을 통해 창을 닫아준다.
          Navigator.pop(context);
        });

        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
            //  대화 창의 외부 크기
            content: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //  인디케이트 크기 설정
                    const SizedBox(
                      height: 50.0,
                      width: 50.0,
                      //  인디게이트의 모양, 색깔 성정
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                        strokeWidth: 5.0,
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 24, height: 1.5)
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
