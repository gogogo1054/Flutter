//  메서드에 반환타입 형태로 future객체를 사용. 나중에 결과를 준다는 의미
Future<int> myRequest1(num) { //  미래에 <int> 반환한다.
  return Future(() {
    int rNum = 0;
    //  전달된 인수만큼 반복하므로 시간이 걸리는 작업이라 가정한다.
    for(int i=0; i<=num; i++)
    {
      rNum = rNum + i; 
    }
    return rNum;
  });
}

//  비동기를 사용하는 경우. 결과가 오기전에 화면이 구현하는 것
void main() {
  print("main시작 1-1 ");
  //  메서드 호출 후 Future<int>객체를 반환한다.
  var myReq1 = myRequest1(1000);  //  결과를 기다리지 않고 다음 진행
  print(111); //  print문이 먼저 실행된다.
  myReq1.then( (data) {
    //  결과가 도착하면 나중에 출력된다.
    print('main작업 1-1 : $data');  //  나중에 가장 먼저 출력(첫번째)
  },  onError: (e) {
    //  요청 실패 시 에러 메세지 출력
    print(e);
  });
  print("main끝 1-1");
  print("==========================================================");

  print("main시작 1-2 ");
  //  호출과 동시에 then절을 사용한다. 즉 위와 동일하다.
  myRequest1(100).then( (data) {
    print('main작업 1-2 : $data');  //  나중에 두번째로 출력
  },  onError: (e) {
    print(e);
  });
  print("main끝 1-2");
  print("==========================================================");

  // 내부 클래스에 사용할 변수 생성
  //  inner클래스(내부클래스)이므로 이 변수 사용이 가능하다.
  int nCount = 10;
  //  Future객체를 통해 내부클래스로 정의한다.
  Future<int> myRequset2 = Future(() {
    int rNum = 0;
    for(int i=0; i<=nCount; i++) {
      rNum = rNum + i;
    }
    return rNum;
  });

  //  Future객체를 통해 즉시 실행
  print("myRequest2 시작3");
  myRequset2.then( (data) {
    //  나중에 결과가 도착하면 출력됨
    print('myRequest2 작업3 : $data');  //  세번쨰로 출력됨(마지막)
  },  onError: (e) {
    print(e);
  });
  print("myRequest2 끝3");
  /*
    위에서 호출한 3개의 메서드는 모두 다시간이 많이 걸리는 작업이므로
    main()메서드가 종료되더라도 실행되다가, 결과가 콜백되면 그때 종료된다.
    Java의 Thread(쓰레드)와 유사한 동작방식을 가진다.
  */
}