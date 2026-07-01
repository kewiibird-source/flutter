import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그띠 없애기 (기본 트루)
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white // 백그라운드 색상
        ),
        home: Scaffold(
          appBar: AppBar( // 상단 영역
            title: Text("테스트!"),
            backgroundColor: Colors.blue[100],
          ),
          drawer: Drawer(), // 햄버거 메뉴
          body: Center( // 가운데 정렬
            child: Column( // 위에서 아래로 정렬
              mainAxisAlignment: MainAxisAlignment.center, // column 전체 가운데 정렬
              children: [ // 여러 위젯
                Text("가운데", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                IconButton(onPressed: (){}, icon: Icon(Icons.star, color: Colors.yellow, size: 180)),
                SizedBox(height: 20),
                Container(
                  height: 100, width: 100, // 컨테이너 크기
                  color: Colors.black, // 컨테이너 검정
                  child: Center(child: Text("네모 박스", style: TextStyle(color: Colors.white))), // 컨테이너 안 텍스트, 가운데정렬
                )
              ],
            ),
          )
        )
    );
  }
}
