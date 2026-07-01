import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Container(
            width: 150, height: 150,
            color: Colors.green,
            child: Center(
              child: Text("box1")
            )
          ),
          MyBox(180, 180, Colors.yellow, "box2!"),
          MyBox(130, 120, Colors.purple, "box3!")
        ],
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final double width; // 위젯의 변수는 상수화가 필수다.
  final double height;
  final Color color;
  final String txt;
  const MyBox(double this.width, double this.height, Color this.color, String this.txt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, height: height,
      color: color,
      child: Center(child: Text(txt))
    );
  }
}
