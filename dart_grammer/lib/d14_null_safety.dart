void main() {
  //  *** Nullable &  Non-Nullable ***
  int num1 = 5; //  null 값을 허용하지 않는 변수로 선언
  int? num2 = 2;  //  null 값을 허용하는 변수

  //  num1 = null //  에러 발생 : Non-Nullable
  num2 = null; //  Ok : Nullable

  //  String str1 = null  //  error : Non-Nullable
  String? str2 = null; //  ok : Nullable

  print("1========================================================");

  //  *** Null Safety 규칙 *** null 일때 안전하게 사용하기 위해

  //  NonNullable 변수는 값 대입 없이 사용할때 error
  //  int a1; print(a1);  //  에러 발생
  int? a2;
  print(a2);

  //  a2 변수는 Nullable. 선언과 동시에 초기값이 Null이 대입되어 초기화된다.
  //  a1 변수는 Non-Nullable. null로 자동 초기화가 불가능해 에러가 발생한다.

  //  var 타입에서의 Null Safety
  //  int 타입으로 유추. Non-Nullable 변수이므로 Null 대입 불가능
  var a3 = 10;
  var a4 = null; //  dynamic으로 유추
  var a5; //  dynamic으로 유추
  // var? a6 = null;  //  error

  // var로 타입 선언시 Nullable 과 Non-Nullable로 자동 유추가 된다.
  //  var타입 뒤에는 ? 를 추가할 수 없다.

  print("2========================================================");

  //  *** Null Safety Operator ***

  int num3 = 5;
  int? num4;

  //  ! : null check operator - runtime error throw
  //  변수 뒤에 ! 을 추가하면 이 변수 값이 null인 경우 runtime error가 발생한다.

  // num4 = 10; //  이 줄이 없으면 다음 줄 에러
  // num3 = num4; //  컴파일 전 체크
  // num3 = num4!; //  실행 시 체크
  // print(num4);

  //  ?. ?[ ] ?.. - null aware operator
  //  String name;  //  <-- 값이 대입되지 않고 사용되면 null일 수 있다.
  String? name;

  // Null이 아닐 때 메서드 실행
  //  ? 를 제거하면 에러 발생함 - 객체가 null인 상태에서는 멤버메서드를 호출할 수
  //  없기 때문
  name = name?.toLowerCase();

  //  Null일 때
  //  n42는 정수가 아니므로 정수로 변환시 에러가 발생한다.
  //  따라서 var2는 -1로 초기화된다.
  int var2 = int.tryParse('n42') ?? -1;
  print('var2 = $var2');

  String? name1;
  //  name1 = 'a';  //  값이 없을 경우 런타임 에러 발생 
  //  String text = name1; // 이렇게 에러가 발생할 경우 대처하는 법
  //  변수 뒤에 !를 붙여해결하는 것이 좋다.
  //  !를 붙여 선언하면 사용되는 시점에서
  //  컴퓨터가 null값이 절대 아니라는 것을 알고 에러를 없애준다. ( 값은 대입해야한다. )
  String text = name1!;
  print(text);  //  값이 대입되지 않으면 결국 null이므로 null 에러가 발생한다.
}