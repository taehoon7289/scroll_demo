import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyMain());

class MyMain extends StatelessWidget {
  const MyMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  void pushDetail(int index) async {
    var result = await Get.to(() => MyDetail(), arguments: index);
    print('result $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold 는 StatefulWidget 상속 받는다.
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: Hero(
                tag: '1',
                child: ElevatedButton(
                  onPressed: () {
                    pushDetail(1);
                  },
                  child: Text('1번연결'),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Hero(
              tag: '2',
              child: ElevatedButton(
                onPressed: () {
                  pushDetail(2);
                },
                child: Text('2번연결'),
              )),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.topCenter,
            // Container는 StatelessWidget을 상속받는다.
            color: Colors.pink,
            // 영역(content + border)의 색상
            // padding: EdgeInsets.all(50),
            // width: 350,
            // height: 350,
            child: Center(
              // Center는 Align 상속 받음.
              child: SingleChildScrollView(
                // Row 일때는 변경해줘야함.
                scrollDirection: Axis.horizontal,
                child: Row(
                  // Column, Row 는 Flex 를 상속 받는다.
                  mainAxisAlignment: MainAxisAlignment.center, // 기본값
                  crossAxisAlignment: CrossAxisAlignment.center, // 기본값
                  mainAxisSize: MainAxisSize.max, // 기본값
                  children: [
                    GestureDetector(
                      onDoubleTap: () {
                        print('첫번째꺼 더블탭');
                      },
                      onTap: () {
                        print('첫번째꺼 탭');
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        color: Colors.blue,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('두번째꺼 탭!!');
                      },
                      child: Container(
                        width: 200,
                        height: 40,
                        color: Colors.blue[100],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      color: Colors.blue[200],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          color: Colors.black,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue[100],
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          color: Colors.green,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Hero(
              tag: '3',
              child: ElevatedButton(
                onPressed: () {
                  pushDetail(3);
                },
                child: Text('3번연결'),
              )),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                // Container는 StatelessWidget을 상속받는다.
                color: Colors.amber,
                // 영역(content + border)의 색상
                padding: EdgeInsets.all(50),
                // width: 350,
                // height: 350,
                child: Column(
                  // Column, Row 는 Flex 를 상속 받는다.
                  mainAxisAlignment: MainAxisAlignment.center, // 기본값
                  crossAxisAlignment: CrossAxisAlignment.center, // 기본값
                  mainAxisSize: MainAxisSize.max, // 기본값
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 50,
                      height: 400,
                      color: Colors.blue[100],
                    ),
                    Container(
                      width: 200,
                      height: 400,
                      color: Colors.blue[200],
                    ),
                    Container(
                      width: 200,
                      height: 400,
                      color: Colors.blue[300],
                    ),
                    Container(
                      width: 200,
                      height: 400,
                      color: Colors.blue[400],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          color: Colors.black,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue[100],
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          color: Colors.green,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyDetail extends StatelessWidget {
  const MyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Get.arguments ${Get.arguments}');
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back(result: 4);
                },
                child: Text('뒤로가기')),
            Hero(
                tag: '1',
                child: Image.network(
                    'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI')),
            Hero(
                tag: '2',
                child: Image.network(
                    'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI')),
            Hero(
                tag: '3',
                child: Image.network(
                    'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI')),
          ],
        ),
      ),
    );
  }
}
