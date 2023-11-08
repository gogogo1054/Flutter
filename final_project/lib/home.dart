import 'package:flutter/material.dart';
import 'bottom.dart';
import 'top.dart';


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
        backgroundColor: Colors.blue[100],
        toolbarHeight: 70,
        // appBar 높이 70
        elevation: 0,
        // 음영 0
        title: SizedBox(
          child: Image.asset(
            'asset/img/main.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
            
        // actions: [
        //   // 오른쪽 아이콘 위젯들
        //   Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(right: 10.0),
        //         child: IconButton( 
        //           icon: const Icon(Icons.account_circle_rounded,
        //           size: 27.0),
        //           onPressed: () {
        //             Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => const ViewPage(),) 
        //             );
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ],
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
