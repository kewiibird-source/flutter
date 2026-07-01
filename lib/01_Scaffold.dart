import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // 상단, 중앙, 하단을 알아서 잘 나눠주는 위젯
        appBar: AppBar(
          title: Text("타이틀 영역!!"),
          backgroundColor: Colors.cyan[100],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.purple[100]),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("img2.png"),
                      ),
                      SizedBox(height: 10),
                      Text("가나디", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      Text("test@naver.com", style: TextStyle(color : Colors.blueGrey, fontSize: 13, fontWeight: FontWeight.bold))
                    ],
                  )
              ),
              ListTile( // 사이드 메뉴 - 홈
                leading: Icon(Icons.home),
                title: Text("홈"),
                onTap: (){}, // 호버
              ),
              ListTile( // 사이드 메뉴 - 옵션
                leading: Icon(Icons.settings),
                title: Text("옵션"),
                onTap: (){}, // 호버
              ),
              ListTile( // 사이드 메뉴 - 로그아웃
                leading: Icon(Icons.logout),
                title: Text("로그아웃"),
                onTap: (){}, // 호버
              )
            ],
          ),
        ),
        body: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 50, width: double.infinity, // 컨테이너 크기 (디바이스 기준으로 다 채움)
            color: Colors.limeAccent, // 컨테이너 색상
            // margin: EdgeInsets.fromLTRB(30, 10, 0, 0), // 좌상우하
            padding: EdgeInsets.all(10), // 모든영역에
            child: Text("Hello Flutter"), // 컨테이너 안 텍스트
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.home), iconSize: 40),
              IconButton(onPressed: (){}, icon: Icon(Icons.login), iconSize: 40),
              IconButton(onPressed: (){}, icon: Icon(Icons.logout), iconSize: 40)
            ],
          ),
        ),
      )
    );
  }
}

