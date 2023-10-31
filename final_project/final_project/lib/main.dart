import 'package:flutter/material.dart';
import 'home.dart';
import 'intro.dart';
import 'view.dart';

void main() {
  const Intro();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{

Widget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if(snapshot.hasError) {
      return const Text("Error!!");
    } else if(snapshot.hasData) {
      return const HomeScreen();
    } else {
      return const Intro();
    }
  }
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
        home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 5), () => "Intro Completed."),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 0),
              child: _splashLoadingWidget(snapshot)
          );
        },
      )
    );
  }
}
