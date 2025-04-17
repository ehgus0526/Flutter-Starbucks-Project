import 'package:flutter/material.dart';

class StarbucksSecondPage extends StatelessWidget {
  const StarbucksSecondPage({Key? key}) : super(key: key);

  /// 카드 이미지
  final String cardImgUrl =
      "https://devclass.devstory.co.kr/flutter-basic/2/starbucks-card.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Pay", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {
              print("결제 페이지 사이드바 클릭");
            },
            icon: Icon(Icons.list_rounded),
          ),
          SizedBox(width: 20),
        ],
      ),

      body: Column(
        children: [
          // 카드 리스트 영역
          Expanded(
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.85),
              itemCount: 10,
              itemBuilder: (context, index) {
                // 카드
                return Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        offset: Offset(0, 5),
                        spreadRadius: 1,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Image.network(cardImgUrl),
                );
              },
            ),
          ),

          // 하단 버튼 영역
          Container(
            height: 72,
            color: Colors.white,
            child: Row(
              children: [
                // 쿠폰 버튼
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      print("쿠폰 클릭");
                    },
                    child: Text(
                      "Coupon",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(height: 12, width: 1, color: Colors.grey),
                // e-Gift 버튼
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      print("e-Gift 클릭");
                    },
                    child: Text(
                      "e-Gift Item",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
