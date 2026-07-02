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

  List<String> checkList = [];
  List<String> imgList = [
    "img1.png", "img2.png", "img3.png"
  ];
  // 함수 생성
  void listChange(String item, bool flg){
     setState(() {
       if(flg){
         checkList.add(item);
       } else {
         checkList.remove(item);
       }
     });
  }

  Widget MyCheckBox(String title, {required String imgUrl}){
    return CheckboxListTile( // value와 onChanged는 필수값
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(title),
        value: checkList.contains(imgUrl),
        onChanged: (value){
          listChange(imgUrl, value!);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
            children: [
              MyCheckBox("가나디1", imgUrl: imgList[0]),
              MyCheckBox("가나디2", imgUrl: imgList[1]),
              MyCheckBox("가나디3", imgUrl: imgList[2]),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10
                  ),
                  itemCount: checkList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(checkList[index]);
                  },
                ),
              )
            ],
          )
      ),
    );
  }
}
