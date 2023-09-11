//  추상 클래스 또는 인터페이스로 사용 가능
abstract class Unit {
  move();
  //  동작을 구현하지 않고 ;(세미콜론)으로 마무리 하면 추상 메서드
  //  즉 완성 시키지 않았다는 의미(오버라이딩이 필수)
}

class Marine extends Unit {
  //  기능의 완성
  move() { print("마린이 걸어서 이동");}
}

//  extends나 implements나 동일
class Medic implements Unit {
  // 기능의 완성
  move() { print("메딕이 뛰어서 이동");}
}

void main()
{
  var unit1 = Marine();
  unit1.move();
  
  var unit2 = Medic();
  unit2.move();
  
  //  추상클래스는 상속을 목적으로 생성한다. 객체를 생성할 수 없다.
  // var unit3 = Unit();  //  에러 발생 - 추상 클래스이기 때문
}

