import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mysql_client/mysql_client.dart';

void main() {
  // dbConnector();
  runApp(const MyApp());
}

// Future<void> dbConnector() async {
//   print("Connecting to mysql server...");

//   // MySQL 접속 설정
//   final conn = await MySQLConnection.createConnection(
//     host: 'root.c729jlikz9gk.ap-southeast-2.rds.amazonaws.com',
//     port: 3306,
//     userName: 'admin',
//     password: 'root1234',
//     databaseName: 'sys', // optional
//   );
// }

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
      home: const MyHomePage(title: 'mysql'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();
	_composition = AssetLottie('assets/lottie/splash.json').load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        var composition = snapshot.data;
        if (composition != null) {
          return Lottie(composition: composition);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
