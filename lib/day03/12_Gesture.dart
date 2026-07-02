import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onTap: (){
            print("tap!");
          },
          onDoubleTap: (){
            print("double Tap!");
          },
          onLongPress: (){
            Fluttertoast.showToast(
                msg: "가나디 ㄱ-",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP, // 띄우는 위치
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 40.0
            );
          },
          child: Image.asset("img2.png")
        ),
      ),
    );
  }
}
