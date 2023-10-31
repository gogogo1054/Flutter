import 'package:flutter/material.dart';
import 'bottom.dart';
import 'top.dart';
import 'view.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        toolbarHeight: 70,
        // appBar 높이 70
        elevation: 0,
        // 음영 0
        title: InkWell(
          onTap:() { }, // 주소 설정 페이지로 이동
            child: const Text('Ladel',
                style: TextStyle(fontSize: 30.0))),
        // 주소
        actions: [
          // 오른쪽 아이콘 위젯들
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton( 
                  icon: const Icon(Icons.account_circle_rounded,
                  size: 27.0),
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewPage(),) 
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Top(),
            Bottom(),
          ],
        ),
      ),
    );
  }
}
