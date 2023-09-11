class Unit
{
  //  멤버 변수를 private로 선언. 정보 은닉화를 위해
  late String _name;
  late int _age;

  //  메뉴를 이용하여 자동 생성 : [메뉴] Code => Generate / alt + insert
  //  Dart에서 사용하는 getter, setter
  int get age => _age;

  set age(int value) {
    _age = value;
  }

  // String get name => _name;
  // String get name => 'My name is $_name';
  String get name {
    return 'My name is $_name';
  }

  //  일반 메서드 형태로 세터 메서드 직접 생성
  //  자바에서 사용하는 getter, setter 방식으로 이렇게 사용해도 된다.
  void setName(String name) {
    this._name = name;
  }

  void setAge(int age) {
    this._age = age;
  }

}