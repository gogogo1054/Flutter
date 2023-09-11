void main()
{
  int num1 = 1;
  double num2 = 2.1;
  String name = "홍길동";

  myFunction1(num1); // 가능
  // myFunction(num2);  // 에러

  myFunction2(num1); // 가능 : num은 int, double의 supertype이기 떄문
  myFunction2(num2); // 가능

  myFunction3(num1);  // 가능 : dynamic은 자바에서의 Object와 같은 느낌이라
  myFunction3(num2);  // 가능
  myFunction3(name); // 가능
}

myFunction1(int val)
{
  print("fuc1 : $val");
}

myFunction2(num val)
{
  print("func2 : $val");
}

myFunction3(dynamic val)
{
  print("func3 : $val");
}