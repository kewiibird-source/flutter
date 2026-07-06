import 'package:flutter/material.dart';

class BPage extends StatelessWidget {

  final String? msg; // ? 는 null 허용
  const BPage({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("B 페이지!"),
          // automaticallyImplyLeading: false, 뒤로가기 버튼
        ),
        body: Center(
          child: Text(msg ?? "B페이지! 전달 받은 값 없음!"),
        ),
      ),
    );
  }
}
