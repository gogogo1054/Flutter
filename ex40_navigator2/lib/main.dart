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
      //  개발자가 직접 정의한 Page1 클래스를 사용한다.
      home: const Page1(),
    );
  }
}

//  stful 단축키를 통해 자동완성
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              //  2페이지로 전환되면서 1페이지는 사라짐(navigator1과 다름)
              child: const Text('2페이지로 교체',
                style: TextStyle(fontSize: 24)),
              onPressed: () {
                //  스택에 페이지 추가
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page2(),
                    //  초단위로 시간 설정
                    transitionDuration: const Duration(seconds: 2),
                    //  밀리세컨드로 시간 설정
                    // transitionDuration: const Duration(milliseconds: 500),
                    // 페이지 전환시 애니메이션 효과 적용
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      // Offset(0.0, 1.0)  // 하단에서 올라옴
                      // Offset(1.0, 0.0)  // 오른쪽에서 나옴
                      // Offset(0.0, -1.0)  // 상단에서 올라옴
                      // Offset(-1.0, 0.0)  // 왼쪽에서 나옴

                      var begin = const Offset(0.0, -1.0);
                      var end = Offset.zero;  //  Offset(0.0, 0.0)과 동일
                      //  일반적인 애니메이션 곡선을 줄때 자세한 것은 교안 참조
                      var curve = Curves.elasticInOut;
                      //  Tween을 사용하여 Animation으로 변환
                      var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      //  SlideTransition은 Animation<Offset>을 가져와서
                      //  애니메이션 값이 변경될때마다 자식을 변환
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,  
                      );
                    }
                  ),
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              onPressed: () {
                //  스택에 페이지 추가
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page3(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
              child: const Text('3페이지로 교체',
                style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    print('Page2');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ElevatedButton(
              child: const Text('3페이지로 교체',
                style: TextStyle(fontSize: 24)),
              onPressed: () {
                //  스택에 페이지 추가
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, animation2) => const Page3(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              onPressed: () {
                //  스택에 페이지 추가
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, animation2) => const Page1(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
              child: const Text('1페이지로 교체',
                style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    print('Page3');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(
              child: const Text('1페이지로 교체',
                style: TextStyle(fontSize: 24)),
              onPressed: () {
                //  스택에 페이지 추가
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page1(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              onPressed: () {
                //  스택에 페이지 추가
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page2(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
              child: const Text('2페이지로 교체',
                style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}