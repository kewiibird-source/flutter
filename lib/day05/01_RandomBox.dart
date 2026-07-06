import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
// 화면에 랜덤한 위치에 박스 10개 그리기(1부터 10까지 담긴), 위치는 화면 내에
class _MyAppState extends State<MyApp> { // 변수 메소드 정의
  Random ran = Random();
  List<Widget> list = []; // 랜덤한 박스 리스트
  int currentIndex = 0;
  void createBox(){ // 박스 재배치 함수
    List<Widget> tempList = [];
    for(int i=1; i<=10; i++){
      tempList.add(
          Positioned(
            // ran.nextInt(MediaQuery.of(context).size.width-50) as double
            // ran.nextDouble() => 0.0 ~ 1.0
              left: ran.nextDouble() * (MediaQuery.of(context).size.width-50),
              top: ran.nextDouble() * (MediaQuery.of(context).size.height-100),
              child: GestureDetector(
                onTap: (){
                  removeBox(i-1);
                },
                child: Container(
                  width: 50, height: 50,
                  color: Colors.green[100],
                  child: Center(
                    child: Text("$i"),
                  ),
                ),
              )
          )
      );
    }
    setState(() { // 랜더링
      list = tempList;
    });
  }

  void removeBox(int index){
    if(currentIndex == index){
      currentIndex++;
      setState(() {
        list.removeAt(0);
      });
    }

    if(list.length == 0){
      currentIndex = 0;
      createBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child:
                Stack(
                  children: list,
                )
            ),
            Container(
              height: 50, color: Colors.grey[100],
              child: Center(
                child: ElevatedButton(
                    onPressed: createBox,
                    child: Text("랜덤 박스 생성!")
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
