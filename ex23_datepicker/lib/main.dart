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
      home: const MyHomePage(title: 'Ex23_Datepicker'),
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

  String _selectedDate = DateTime.now().toString();

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
            Text( _selectedDate, style: const TextStyle(fontSize: 30)),
            ElevatedButton(
              //  현재날짜 혹은 선택한 날짜
              child: const Text('Show DatePicker',
                style: TextStyle(fontSize: 24)),
              onPressed: () => selectDate(),
            ),
          ],
        ),
      ),
    );
  }

  //  현재 시간을 구해 다음주 주말이면 다음주 월요일을 선택한다.
  DateTime selectNowDate() {
    DateTime now = DateTime.now();
    
    if(now.weekday == 6) {
      now = now.add(const Duration(days: 2));
    } else if (now.weekday == 7) {
      now = now.add(const Duration(days: 1));
    }
    return now;
  }

  //  특정 날짜를 비활성화(오늘 날짜가 포함되면 에러 발생)
  bool _predicate(DateTime day) {

    // //  9/1 ~ 9/30까지 활성화(비활성화도 풀어줌)
    //  if ((day.isAfter(DateTime(2023, 9, 1)) &&
    //       day.isBefore(DateTime(2023, 9, 30)))) {
    //         return true;  //  활성화
    //       }

    // //  하단의 내용과 겹치므로 하나만 사용 가능
    // //  주말 비활성화
    // if (day.weekday != 6 && day.weekday != 7) {
    //   if (day != DateTime(day.year, day.month)) {
    //     return true;
    //   }
    //     return true;
    // }

    //  매달 1~10일까지 비활성화
    List days = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    if(!days.contains(day.day.toInt())) {
      return true;
    }

    return false;
  }

  //  데이터 피커를 오픈한다.
  Future selectDate() async {
    DateTime now = DateTime.now();

    DateTime? picked = await showDatePicker(
      context: context,
      //  시작화면이 연도별 선택화면으로 시작
      // initialDatePickerMode: DatePickerMode.year, 
      initialDate: selectNowDate(), //  초기 날짜
      firstDate: DateTime(now.year - 2),  //  선택가능한 년도 시작(시작년도)
      lastDate: DateTime(now.year + 2), //  선택가능한 년도 종료(마지막년도)
      selectableDayPredicate: _predicate, //  날짜 비활성화 설정
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data:
          // ThemeData.light(),  //  라이트 테마(기본테마)
          // ThemeData.dark(), //  다크 테마
          ThemeData(primarySwatch: Colors.pink), //  사용자 설정
          child: child!,
        );
      },
    );
    //  여기서 사용자가 날짜를 선택할때까지 코드가 블록됨
    if(picked != null) {
      setState(() {
        _selectedDate = picked.toString().substring(0, 10);
      });
    }
  }
}

// 폰의 시간과 날짜가 달라보이는 것은 지역 설정이 미국이기 때문이다.
//  폰에서 국가 설정을 바꿔주면 된다. (코드로 변경할 필요가 없다.)
