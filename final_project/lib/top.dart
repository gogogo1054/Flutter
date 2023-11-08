import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/order.dart';
import 'package:final_project/search.dart';
import 'package:final_project/view.dart';
import 'package:flutter/material.dart';

class Top extends StatefulWidget {
  const Top({Key? key}) : super(key: key);

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  List item = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  List items = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 30.0,
              left: 17.0,
              bottom: 14.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '클린업 라이프',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )
                ),
                const Text(
                  '클린업과 함께하는 클린이벤트',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'asset/img/clothes${items[index]}.png',
                            fit: BoxFit.cover,
                            width: 200,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 17),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120.0,
                          height: 100.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const Order()),
                                );
                              }, 
                              icon: const Icon(
                                Icons.water_drop_outlined,
                                size: 40,
                                color: Colors.blue,
                              ),
                            ),
                            const Text('비회원 세탁',
                                  style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 17),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120.0,
                          height: 100.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const Search()),
                                );
                              }, 
                              icon: const Icon(
                                Icons.search_rounded,
                                size: 40,
                                color: Colors.blue,
                              ),
                            ),
                            const Text('매장 검색',
                                  style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 17),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120.0,
                          height: 100.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(builder: (context) => const ViewPage())
                                  );
                                },
                                icon: const Icon(
                                  Icons.account_circle_rounded,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                              const Text('회원 세탁',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CarouselSlider(
              items: item.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {}, // 화면 이동
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'asset/img/image$i.png',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 12.0,
                          right: 10.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Opacity(
                              opacity: 0.5,
                              child: Container(
                                color: Colors.black,
                                width: 60.0,
                                height: 30.0,
                                child: Center(
                                  child: Text('$i / 11',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true, //자동재생 여부
                height: 130.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin:EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                  ),
                  child: Container(
                    padding:EdgeInsets.zero,
                    width: 90.0,
                    height: 100.0,
                    constraints: const BoxConstraints(),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 40,
                        ),
                        Text('포인트',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin:EdgeInsets.zero,
                  child: Container(
                    padding:EdgeInsets.zero,
                    width: 90.0,
                    height: 100.0,
                    constraints: const BoxConstraints(),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 40,
                        ),
                        Text('이벤트',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin:EdgeInsets.zero,
                  child: Container(
                    padding:EdgeInsets.zero,
                    width: 90.0,
                    height: 100.0,
                    constraints: const BoxConstraints(),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          size: 40,
                        ),
                        Text('쿠폰',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin:EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
                  ),
                  child: Container(
                    padding:EdgeInsets.zero,
                    width: 90.0,
                    height: 100.0,
                    constraints: const BoxConstraints(),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.grid_view,
                          size: 40,
                        ),
                        Text('메뉴',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
