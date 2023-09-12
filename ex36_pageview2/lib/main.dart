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
      home: const MyHomePage(title: 'Ex36_Pageview2'),
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
  //  페이지뷰를 사용하기 위한 PageController 생성
  final _pageController = PageController(
    initialPage: 0,
  );

  //  각 페이지의 페이지명으로 리스트 생성
  List<String> pages = ['Page 1', 'Pagq 2', 'Page 3'];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //  세개의 페이지 바로가기 버튼
              children: [
                ElevatedButton(
                  child: const Text('Page 1', 
                    style: TextStyle(fontSize: 20)),
                    onPressed: () => onClick(0),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  child: const Text('Page 2', 
                    style: TextStyle(fontSize: 20)),
                    onPressed: () => onClick(1),
                ),
                ElevatedButton(
                  child: const Text('Page 3', 
                    style: TextStyle(fontSize: 20)),
                    onPressed: () => onClick(2),
                ),
              ],
            ),
            const Text(
              '터치한 후 좌우로 Swipe 하세요.',
                style: TextStyle(fontSize: 24.0,),
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                //  페이지 뷰의 콘트롤러 연결
                controller: _pageController,  //  컨트롤러
                itemCount: pages.length,  //  페이지 개수
                itemBuilder: (context , index) {  //  페이지 값을 반환받아 출력
                  return getPage(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onClick(int index) {
    if (_pageController.hasClients) {
      //  애니메이션 효과 없이 화면 전환
      // _pageController.jumpToPage(index);

      //  적용된 시간만큼 애니메이션이 적용되어 전환
      _pageController.animateToPage(
        index,
        // duration: const Duration(milliseconds: 1), //  효과 없는 것처럼 보임
        duration: const Duration(milliseconds: 400), 
        curve: Curves.easeInOut,  // 애니메이션 진행 속도 조절
      );
    }
  }

  Widget getPage(int index) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getIcon(index),
              Text(
                pages[index],
                style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  //  아이콘
  Widget getIcon(int index) {
    if (index == 0) {
      return const Icon(Icons.camera_alt, color: Colors.red, size: 35.0);
    } else if (index == 1) {
      return const Icon(Icons.add_circle, color: Colors.orange, size: 35.0);
    } else {
      return const Icon(Icons.star, color: Colors.indigo, size: 35.0);
    }
  }

}
