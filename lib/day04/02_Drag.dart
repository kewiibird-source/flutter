import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // double x = 150;
  // double y = 150 ;
  Offset position = Offset(150, 150);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Stack(
            children: [
              Positioned(
                  // top: y, left: x
                  left: position.dx, top: position.dy,
                  child: GestureDetector(
                    onTap: (){
                      print(MediaQuery.of(context).size.width);
                      print(MediaQuery.of(context).size.height);
                    },
                    onPanUpdate: (e){
                      setState(() {
                        // print(e); // delta 이동한 정보
                        // x += e.delta.dx;
                        // y += e.delta.dx;
                        // position + delta (Offset끼리 덧샘) => (152,153)
                        position += e.delta;
                      });
                    },
                    child: Container(
                        width: 100, height: 100,
                        color: Colors.lightGreenAccent
                    ),
                  )
              ),
            ]
        ),
      ),
    );
  }
}
