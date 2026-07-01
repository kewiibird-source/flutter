import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 한줄(좌-우)에 몇개 넣을것인가? (mainAxis와 반대:grid는 상-하)
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
            ),
            itemCount: 10,
            itemBuilder: (context, index) { // context 위젯의 위치값, itemCount 만큼 반복함
              return Container(
                color: Colors.blue[100 * ((index % 9) + 1)], // index가 9일때 9로 나눠서 나머지 0 + 1 해서 1부터 다시 시작
                child: Center(child: Text("${index+1}", style: TextStyle(color: Colors.white),)), // ${index+1} > "1" 값을 String으로 감싼다
              );
            },
        ),
      ),
    );
  }
}
