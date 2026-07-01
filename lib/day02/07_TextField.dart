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
  TextEditingController idCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // column 기준으로 상-하
              children: [
                TextField(
                  controller: idCtrl,
                  // obscureText: false, // pwd 가리기용
                  decoration: InputDecoration(
                    labelText: "아이디",
                    hintText: "ex) text1234", //placeholder
                    prefixIcon: Icon(Icons.perm_identity),
                    suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.yellow[100],
                    // enabled: false

                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: (){
                      print("입력된 아이디 : ${idCtrl.text}");
                    },
                    child: Text("로그인")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
