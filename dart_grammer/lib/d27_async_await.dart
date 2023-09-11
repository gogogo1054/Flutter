import 'dart:io';

//   async와 await는 pair : await는 async내부에서만 사용 가능하다.
Future<void> myRequest1() async
{
  print("myRequest1() 작업시작");
  //  1초씩 딜레이 시켜준다. 10초가 소요되는 긴 작업 가정
  for(int i=0; i<10; i++) {
    stdout.write('$i ');
    //  await는 함수에만 사용 가능. 1초 쉬라는 것
    //  1초 쉬는동안 모든 문구가 출력됨 실행문 중에 0이 찍히는 이유
    await Future.delayed(Duration(seconds: 1));
  }
  print('\n myRequest1() 작업끝');
}

//  Futuire<int>객체를 반환하는 메서드
Future<int> myRequest2(num) //  게임으로 치면 경매장
{
  //  결과가 미래에 생김. 기다리지 않음
  var req = Future(() {
    print('myRequest2(num) 작업시작');  //  이 작업을 기다려주지 않음
    int rNum = 0;
    for(int i=0; i<num; i++) {
      rNum += 1;
    }
    print('myRequest2(num) 작업끝');
    return rNum;  //  이 결과는 나중에 생김
  });
  //  위의 결과가 생성되기 전에 리턴하는 것이므로 잘못된 사용법. 시간차 공격
  return req;
}

//  바로 위 메서드와 동일한 형태로 정의
Future<int> myRequest3(num)
{
  var req = Future(() {
    print('myRequest3(num) 작업시작');
    int rNum = 0;
    for(int i=0; i<num; i++) {
      rNum += 1;
    }
    print('myRequest3(num) 작업끝');
    return rNum;
  });
  return req;
}

void main() async { //  async를 제거하면 에러가 발생된다. ( await 사용 불가)
  //  비동기를 위한 async와 await는 반드시 같이 사용되어야 한다.
  print('main 시작01');
  myRequest1();
  print('main 끝01');

  //  결과를 기다렸다가 변수에 받음.
  print('main 시작02');
  /*
    Future와 then절을 함께 사용하거나(방법1)
    async와 await를 사용해야 한다.(방법2)
  */
  var val2 = await myRequest2(10);  //  await 사용을 위해 async 선언
  var val3 = myRequest3(20);
  val3.then((value) {
    print('then절에서 출력 : $value');
  },  onError: (error) {
    print(error);
  });

  print('val2 : $val2');
  print('val3 : $val3');
  print('main 끝02');
}