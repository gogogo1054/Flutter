import 'd19_class3_private2.dart';

class Unit
{
  //  변수명 그냥 쓸 경우 public, _로 시작하면 private(암묵적)
  late String _name;
  late int age;

  //  생성자 간단하게 사용하기
  //  어짜피 연결될 내용 파라미터 부분에서
  Unit(this._name, this.age);
}

void main()
{
  //  Unit 클래스는 같은 라이브러리이므로 private멤버도 접근 가능하다.
  var unit1 = Unit("마린", 25);
  print(unit1._name); //  private이지만 에러 없이 출력됨(Java에서는 에러)
  print(unit1.age);

  //  Unit2 클래스의 경우 외부에서 정의되었으므로 private멤버는 접근할 수 없다.
  var unit2 = Unit2("메딕", 20);
  // print(unit2._name); //  private 적용됨 다른 파일이므로 에러 발생
  print(unit2.age);
}
/*
  dart에서는 하나의 파일이 하나의 library이다.
  그래서 private으로 할 경우 해당 파일에만 또는 해당 라이브러리에서만 접근이 가능하다.
  외부 파일에서는 접근이 불가능하다.
*/