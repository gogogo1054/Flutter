void main()
{
  something1('홍길동');

  something2('전우치');
  something2(30);

  //  *** Named parameters *** : 매개변수를 이름을 통해 부여할 수 있다.
  //                              따라서 순서를 변경할 수 있다. Set{}처럼
  //                              키값으로 찾아간다.

  //  파라미터를 옵션 처리하기
  //  선택형 매개변수로 선언되었기 때문에
  //  이렇게 {}있는 것은 사용해도 되고 안해도 된다.
  something3();
  //  뒤의 파라미터만 이름을 주어 값을 전할 수 있다.
  something3(name : '손오공');

  // 옵션이 있는 것은 아래와 같이 사용하면 된다. 하나만 사용해도 되고
  // 둘 다 사용해도 된다. 형식은 (key, value)만 지키면 된다.
  something4(); //  둘 다 null으로 출력
  something4(name : "유비");  //  age만 null
  something4(age : 20); //  name만 null
  //  즉 key, value값만 지켜서 넣어준다면 순서를 지키지 않아도 문제가 없다.
  //  Set의 집합 {}이므로 성질을 갖고 있기 떄문이다.
  something4(age : 40, name : "관우");

  something5('해리포터');
  something5('멀린', age : 20);

  something6('이순신');
  something6('강감찬', age : 20);

  something7('권율', age : 30);
}

//  자바와 같이 사용할 수 있다.
void something1(String name)
{
  print(name);
}

//  파라미터 타입을 생략하면 dynamic 타입이 됨
//  어떤 타입(숫자, 문자)이든 전달 가능
void something2(name)
{
  print(name);
}

//  파라미터 옵션 처리. {}가 있는 것은 데이터를 사용해도 되고 안해도 된다는 의미.
//  쓸때는 name : 값을 넣어야 한다.
void something3({String? name}) //  null 체크가 중요하다.
{
  print('name : $name');
}

/*
  메서드 오버로딩 : 오버로딩이란 메서드를 정의할 때 동일한 이름으로 정의하되
  매개변수의 개수나 타입을 다르게해서 서로 다른 메서드처럼 정의하는 기법을 말한다.
  예) myFunc(int a), myFunc(int a, int b), myFunc(double a, String b)
  위 3가지 메서드는 모두 다르다.
*/
//  여러가지 파라미터를 처리하기 위해 오버로딩할 필요가 없다.
void something4({String? name, int? age})
{
  print('name : $name age : $age');
}

//  필수 + 옵션
void something5(String name, {int? age})
{
  print('name : $name age : $age');
}

//  파라미터의 디폴트값 . ? 빠짐
void something6(String name, {int age = 10})
{
  print('name : $name age : $age');
}

//  반드시 필요한 파라미터라면... 이전 방식 @required
void something7(String name, {required int age})
{
  print('name : $name age : $age');
}

