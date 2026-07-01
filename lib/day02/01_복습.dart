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
        appBar: AppBar(
          title: Text(
            "타이틀!",
            style: TextStyle(
              fontWeight: FontWeight.w500, // 글자굵기
              color: Colors.blue, // 글자색
              letterSpacing: 10, // 자간
              decoration: TextDecoration.underline, // 글꾸미기
              decorationStyle: TextDecorationStyle.dotted, // 꾸미기 효과(점선)
              decorationColor: Colors.red // 꾸미기 효과(색상)
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
            IconButton(onPressed: (){}, icon: Icon(Icons.home))
          ],
        ),
        drawer: Drawer(),
        body: Center(
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: (){
                    print("버튼 클릭!");
                  },
                  child: Text("선택!"), // 버튼 텍스트
                  style: ElevatedButton.styleFrom( // 버튼 스타일
                    backgroundColor: Colors.lightBlueAccent, // 배경색
                    foregroundColor: Colors.pinkAccent, // 글자색
                    shadowColor: Colors.black, // 그림자색
                    elevation: 5, // 그림자 수준
                    shape: RoundedRectangleBorder( // 버튼 모양
                      borderRadius: BorderRadius.circular(12) // 모서리 조절
                    ),
                    side: BorderSide( // 테두리 (border)
                      color: Color(0xfff0000f),
                      width: 3
                    )
                  ),

              ),
              MyButton(text : Text("안녕?")), // 만든 위젯 가져다쓰기
              MyButton(text : Text("ㅋㅋ")),
              MyButton(text : Text("Hello")),
              MyButton(text : Text("Flutter"))
            ],
          ), // 기본 버튼에는 텍스트
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
// 버튼 위젯 하나 만든것
// 인자값을 받아서 처리할 수 있다
class MyButton extends StatelessWidget {
  final Text text;
  const MyButton({super.key, required Text this.text}); // 자바의 this.name = name 느낌

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        print("버튼 클릭!");
      },
      child: text, // 버튼 텍스트
      style: ElevatedButton.styleFrom( // 버튼 스타일
          backgroundColor: Colors.lightBlueAccent, // 배경색
          foregroundColor: Colors.pinkAccent, // 글자색
          shadowColor: Colors.black, // 그림자색
          elevation: 5, // 그림자 수준
          shape: RoundedRectangleBorder( // 버튼 모양
              borderRadius: BorderRadius.circular(12) // 모서리 조절
          ),
          side: BorderSide( // 테두리 (border)
              color: Color(0xfff0000f),
              width: 3
          )
      ),

    ); // 기본 버튼에는 텍스트;
  }
}
