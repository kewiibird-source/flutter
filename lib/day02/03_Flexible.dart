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
        body: Row(
          children: [
            Flexible(child: Container(color: Colors.red), flex: 1),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Flexible(child: Container(color: Colors.deepOrange), flex: 2),
                  Flexible(child: Container(color: Colors.purple), flex: 1),
                  Flexible(child: Container(color: Colors.green), flex: 1)
                ],
              ),
            ),
            Flexible(child: Container(color: Colors.yellow), flex: 1)
          ],
        ),
      ),
    );
  }
}
