import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Material(
          child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:25.0, left:10,),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:() { },
                      child: Text('사업자정보확인 |',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[700],
                          )),
                    ),
                    GestureDetector(
                      onTap:() { },
                      child: Padding(
                        padding: const EdgeInsets.only(left:5.0),
                        child: Text('이용약관 |',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[700],
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () { },
                      child: Padding(
                        padding: const EdgeInsets.only(left:5.0),
                        child: Text('전자금융거래이용약관 |',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[700],
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () { },
                      child: const Padding(
                        padding: EdgeInsets.only(left:5.0),
                        child: Text('개인정보처리방침 |',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2.0, left:10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:() { },
                      child: Text('리뷰운영정책 |',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[700],
                          )),
                    ),
                    GestureDetector(
                      onTap:() { },
                      child: Padding(
                        padding: const EdgeInsets.only(left:5.0),
                        child: Text('소비자분쟁해결기준 |',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[700],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0, left:10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:() { },
                      child: Text('(주)서울IT아카데미',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          )),
                    ),
                    const Icon(Icons.keyboard_arrow_down_sharp)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2.0, left:10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:() { },
                      child: Text('(주)서울IT아카데미는 통신판매중개자이며, 통신판매의 당사자가 아닙니다.',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[700],
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2.0, left:10.0, bottom:40,),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:() { },
                      child: Text('(주)서울IT아카데미는 상품, 거래정보 및 거래에 대하여 책임을 지지 않습니다.',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[700],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
