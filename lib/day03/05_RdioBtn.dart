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
  var subject = "java";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            RadioListTile(
              value: "java", // groupValue와 같을때 선택됨
              title: Text("자바"),
              groupValue: subject,
              onChanged: (value){
                setState(() {
                  subject = value!;
                });
              },
            ),
            RadioListTile(
              value: "mysql",
              title: Text("mysql"),
              groupValue: subject,
              onChanged: (value){
                setState(() {
                  subject = value!;
                });
              },
            ),
            RadioListTile(
              value: "fultter",
              title: Text("Fultter"),
              groupValue: subject,
              onChanged: (value){
                setState(() {
                  subject = value!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
