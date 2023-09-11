// class Point
// {
//   int? x;
//   int? y;
// }
//
// class PointDetail extends Point
// {
//   int? z;
// }
//
// void main()
// {
//   PointDetail p1 = PointDetail();
//   p1.x = 4; //  setter
//   p1.y = 5;
//   p1.z = 6;
//   //  자식 클래스(PointDetail)를 부모클래스(Point)로 형변환 하는 것을
//   //  업캐스팅(up-casting)이라 한다.
//   //  부모타입으로 캐스팅해서 사용하다가 자식 객체를 다시 받아야 할 때
//   Point p2 = p1;
//   //  ...
//
//   //  다시 PointDetail의 z값에 접근하거나 사용해야할 때
//   if(p2 is PointDetail) //  is로 판단해서 한 번 확인했기 때문에 as 생략 가능
//   {
//      PointDetail p3 = p2 as PointDetail;  //  다운 캐스팅
//      print(p3.z);
//      print("oo"); //  로그 확인용 맞을경우 o 출력
//   } else {
//     print("xx");
//   }
// }

//  부모 클래스
class Unit {
  var health = 10;
}

//  자식 클래스(Unit을 상속)
class Marine extends Unit {
  var name = '마린';
}

class Medic extends Unit {
  var name = '메딕';
}

void main()
{
  //  객체 생성
  Marine marine = Marine();
  Medic medic = Medic();

  //  marine을 Unit로 형변환 하는것
  Unit unit1 = marine as Unit;  //  객체의 형변환을 위해 as를 사용한다.
  Unit unit2 = medic; //  현재 버전에서는 as 없이도 형변환이 가능하다.

  //  is는 특정타입이 맞다면 즉 상송관계가 있다면 true를 반환한다.
  //  원래 클래스를 확인하는 것
  if(unit1 is Marine) {
    print('마린입니다.');
    print(unit1.name);  //  자바와는 다름. 자바는 이런 방식의 참조가 불가능
  }
  else {
    print('마린이 아닙니다.');
  }
  /*
    자바에서는 부모타입의 참조변수로 자식쪽 멤버변수엦 접근할 수 없다.
    하지만 다트에서는 가능하다. 마치 변수까더 오버라이딩 되는 듯한
    느낌이라 생각하면 된다.
  */
  // print(unit1.name);  =>  단독적으로 해당 문장은 사용 불가능
  /*
    이 문장을 of블럭 외부로 옮기면 에러가 발생한다.
    is를 통해 부모타입을 자식타입으로 변환히 가능한지
    확인한 후 접근을 허용하게 된다.
  */
  //  as 없이 대입해도 정상적으로 출력됨
  if(unit2 is Medic) {
    print("메딕입니다.");
  }
  else {
    print('메딕이 아닙니다.');
  }
}