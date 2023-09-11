import 'package:dart_grammer/d11_method1.dart';

void main()
{
  //  *** Positional parameters ***
  //  따라서 순서를 변경할 수 없다. 자주 쓰지는 않음
  //  List[]처럼 위치로 찾아간다.
  something1();
  something1('홍길동');

  something2('해리포터');
  something2('멀린', 20); //  앞의 것을 사용하지 않고 뒤의 것을 사용할 수 없다.
  //  something2(20, '장비'); //  순서를 변경해서 대입하면 에러 발생

  //  위의 것(something2)과 사용 방법이 같은 것처럼 보이지만 다르다.
  something3('전우치');  
  something3('손오공', 20);

  // 필수 + 옵션
  something4('이순신');
  something4('강감찬', 20);
  //  something4(30, '을지문덕'); //  순서는 바뀌면 안된다.
}

//  파라미터를 옵션 처리. [] 사용해도 되고 안해도 된다.
//  사용 안 할 경우 null이 올수 있게 ?(null safety)를 사용한다.
void something1([String? name]) //  null 체크가 중요하다.
{
  print('name : $name');
}

//  여러가지 파라미터를 처리하기 위해 오버로딩할 필요가 없다.
void something2([String? name, int? age])
{
  print('name : $name age : $age');
}

//  필수 + 옵션
void something3(String name, [int? age])
{
  print('name : $name age : $age');
}

//  파라미터의 디폴트 값. ?가 빠진다.
void something4(String? name, [int age = 10])
{
  print('name : $name age : $age');
}