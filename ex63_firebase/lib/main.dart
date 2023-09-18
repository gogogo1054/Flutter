import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

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
      home: const MyHomePage(title: 'Ex03_Text'),
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

  String name = '';

  FirebaseOptions get firebaseOptions => const FirebaseOptions(
    appId: '1:644723206714:android:c72ad7af46eed3c5376303',
    // appId: "1:644723206714:android:c72ad7af46eed3c5376303",
    apiKey: 'AIzaSyArVtXWkgkbblFgojsmqADmLtFDO9RmrKU',
    projectId: 'flutter-exam-322ab',
    messagingSenderId: '644723206714', 
  );

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    name = app.name;
    print('Initialized default app $app');
  }

  Future<void> initializeSecodary() async {
    name = 'myFcm';
    FirebaseApp app = await Firebase.initializeApp(
      name: name,
      options: firebaseOptions);
    print('Initialized $app');
  }

  //  현재는 하나이지만 여러개를 사용할 경우 : FCM, Storage, Auth ...
  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initialized apps: $apps');
  }

  void options() {
    final FirebaseApp app = Firebase.app(name);
    final FirebaseOptions options = app.options;
    print('Current options for app $name: $options');
  }

  Future<void> delete() async {
    final FirebaseApp app = Firebase.app(name);

    // await app.delete();
    print('App $name deleted');
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
              onPressed: initializeDefault,
              child: const Text('Initialize default app'),
            ),
            ElevatedButton(
              onPressed: initializeSecodary,
              child: const Text('Initialize secondary app'),
            ),
            ElevatedButton(
              onPressed: apps,
              child: const Text('Get apps'),
            ),
            ElevatedButton(
              onPressed: options,
              child: const Text('List options'),
            ),
          ],
        ),
      ),
    );
  }
}
