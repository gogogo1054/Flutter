void main()
{
  int num1 = 1;
  print('num1 : $num1');

  double num2 = 2.0;
  print("num2-1 : $num2");

  double num3 = 2.1;
  print('num2-2 : $num3');

  /*
    Java의 경우 double보다 int가 작은 자료형이므로 아래의 경우
    자동형변환(오토캐스팅)되어 에러가 발생하지 않는다.
    하지만 flutter에서는 모든 변수를 객체로 인식하므로
    명시(강제)적인 형변환이 필요하다.
  */
  // num3 = num1; // 에러 - Java와 달리 자동형변환이 불가능함
  num3 = num1.toDouble(); // flutter는 toDouble 같은 명시적 형변환이 필요하다.
  print('num3 : $num3');

  num2 = 2.6;
  num1 = num2.toInt();  // 소수점 이하 절삭
  print('num1 : $num1');
  /*
    Java의 래퍼클래스처럼 형변환을 위한 메서드를 가지고 있다.
  */

}