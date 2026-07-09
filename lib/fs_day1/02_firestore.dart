import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import '../firebase_options.dart';

void main() async {
  // Flutter 프레임워크와의 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Firebase 초기화 설정
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseFirestore fs = FirebaseFirestore.instance; // DB객체
  TextEditingController nameCtrl = TextEditingController();
  var ageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 유저 삽입!
    Future<void> addUser() async{
      if(nameCtrl.text.isNotEmpty && ageCtrl.text.isNotEmpty){
        await fs.collection("users").add({
          "name" : nameCtrl.text,
          "age" : int.parse(ageCtrl.text), // ageCrtl.text 는 "20"으로받음
          "cdate" : Timestamp.now()
        });
        // add 끝나면 컨트롤러 비워주기
        nameCtrl.clear();
        ageCtrl.clear();
      } else {
        print("이름 또는 나이 입력하셈");
      }
    }
    // 유저 조회 목록
    Widget getUserList() {
      return StreamBuilder(
          stream: fs.collection("users").snapshots(),
          builder: (context, snapshot) {
            // if(snapshot.hasData){
            //   return CircularProgressIndicator(padding: EdgeInsets.all(500));
            //   // return const Center(child: CircularProgressIndicator());
            // }
            return ListView(
              // snapshot.data!.docs까지 list
              children: snapshot.data!.docs.map((doc){
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text("문서 ID : ${doc.id}"),
                  subtitle: Text("나이 : ${doc["age"]}, 이름 : ${doc["name"]}"),
                  trailing: IconButton(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                               title: Text("삭제"),
                               content: Text("정말 삭제하시겠습니까?"),
                               actions: [
                                 TextButton(
                                     onPressed: (){
                                       fs.collection("users").doc(doc.id).delete();
                                       Navigator.of(context).pop();
                                     },
                                     child: Text("삭제")
                                 ),
                                 TextButton(
                                     onPressed: (){
                                       Navigator.of(context).pop();
                                     },
                                     child: Text("취소")
                                 )
                               ],
                              );
                            },
                        );
                      },
                      icon: Icon(Icons.delete)
                  ),
                );
              }).toList(),
            );
          },
      );
    }
    // 유저 수정!
    void updateUser() async{
      var users = fs.collection("users");
      var snap = await users.where("name", isEqualTo: nameCtrl.text).get();
      for(var doc in snap.docs){
        users.doc(doc.id).update({
          "age": int.parse(ageCtrl.text)
        });
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("파이어스토어!")),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    labelText: "이름",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: ageCtrl,
                  decoration: InputDecoration(
                    labelText: "나이",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: addUser,
                        child: Text("저장")
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: updateUser,
                        child: Text("수정")
                    )
                  ],
                ),
                SizedBox(height: 10),
                Expanded(child: getUserList())
              ],  
            ),
          ),
        ),
      ),
    );
  }
}
