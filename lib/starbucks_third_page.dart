import 'package:flutter/material.dart';

/// Starbucks 메인 색상
Color starbucksPrimaryColor = Color.fromARGB(255, 83, 184, 138);

class StarbucksThirdPage extends StatelessWidget {
  const StarbucksThirdPage({Key? key}) : super(key: key);

  /// 전체 메뉴
  final List<Map<String, String>> menu = const [
    {
      "ko": "추천",
      "en": "Recommend",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu1.jpg",
    },
    {
      "ko": "리저브 에스프레소",
      "en": "Reserve Espresso",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/ic/2/starbucks-menu2.jpg",
    },
    {
      "ko": "리저브 드립",
      "en": "Reserve Drip",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu3.jpg",
    },
    {
      "ko": "콜드브루",
      "en": "ColdBrew",
      "imgUrl":
          "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-menu4.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Order", style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              onPressed: () {
                print("주문 페이지 검색창 클릭");
              },
              icon: Icon(Icons.search_outlined),
            ),
            SizedBox(width: 20),
          ],
          // 탭 바 영역
          bottom: TabBar(
            isScrollable: false,
            indicatorColor: starbucksPrimaryColor,
            indicatorWeight: 4,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: "전체 메뉴"),
              Tab(text: "나만의 메뉴"),
              Tab(text: "🎂 홀케이크"),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            // 전체 메뉴 탭 영역
            ListView.builder(
              itemCount: 40,
              itemBuilder: (context, index) {
                final item = menu[index % menu.length];
                final ko = item["ko"] ?? "";
                final en = item["en"] ?? "";
                final imgUrl = item["imgUrl"] ?? "";
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 21,
                  ),
                  child: InkWell(
                    onTap: () {
                      print("$ko 클릭");
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundImage: NetworkImage(imgUrl),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ko,
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              en,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // 나만의 메뉴 탭
            Center(child: Text("나만의 메뉴 탭")),

            // 홀케이크 탭
            Center(child: Text("홀케이크 탭")),
          ],
        ),
      ),
    );
  }
}
