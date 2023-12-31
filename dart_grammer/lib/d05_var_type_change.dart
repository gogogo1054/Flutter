void main()
{
  //  ### 정수, 실수 간 변환 ###
  int num1 = 10;
  double num2 = num1.toDouble();
  num1 = num2.toInt();

  //  ### 문자를 숫자로 변환 ###

  // 실패 시 Exception : 예외가 발생하면 그 즉시 프로그램의 실행이 중지된다.
  int intVal = int.parse('10');
  double doubleVal = double.parse('10.1');

  try //  예외가 발생할 수 있으므로 try ~ on을 사용함. ( Java : try ~ catch )
  {
    var num3 = int.parse('n42');  //  예외 발생 지점. - 문자가 섞여있으므로
    print(num3);
  }
  on FormatException catch(e) //  발생된 예외는 catch절에서 처리한다.
  {
    print('Format error(n42는 숫자 형태가 아닙니다.)');
    print(e); //  FormatException 에러 메세지
  }

  //  null safety
  //  실패 시 null. tryParse에 try ~ on이 들어가 있다. 예외가 생기면 null이 된다.
  int? intVal2 = int.tryParse('10');  //  10으로 변환
  // int?에서 ?은 뒤에가 tryParse가 false이면 null이 들어간다는 의미.
  double? doubleVal2 = double.tryParse('10.1');

  // 삼항연산자 형태로 앞부분에서 예외가 발생하면 ?? 뒷부분의 값이 할당된다.
  int val1 = int.tryParse('n42')  ??  -1;
  //  여기서 int?가 없는 이유 val1에 -1이 들어와있으므로 null이 들어올 수 없다.
  print('val1 = $val1');  //  예외가 발생하므로 삼항연산자에 따라 -1이 할당된다.

  //  var은 어떤값이라도 들어올 수 있다. 즉 null도 들어올 수 있다는 것이므로
  //  ? 을 안 써도 된다.
  var var2 = int.tryParse('n42');
  print('var2 = $var2');  //  예외가 발생하므로 null이 할당됨.

  //  ### 진법 변환 ### 잘 사용 안 함, 시험 때문에
  var n_16 = int.parse('FF', radix: 16);  // 255 16진법
  print('n_16 : FF -> $n_16');
  var n_8 = int.parse('10', radix: 8);  //  8 8진법
  print('n_8 : 10 -> $n_8');
  var n_2 = int.parse('1001', radix: 2);  //  9 2진법
  print('n_2 : 1001 -> $n_2');

  int baseNum = 10;
  var val3 = baseNum.toRadixString(16);
  print('10 hes --> 0x$val3');
  var val4 = baseNum.toRadixString(2);
  print('10 hex --> 0b$val4');

}