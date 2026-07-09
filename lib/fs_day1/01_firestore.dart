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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore fs = FirebaseFirestore.instance; // DB객체
    // fs 객체를 이용해서 db에 접근
    // #crud예시
    // 0.users 컬렉션에 접근 : fs.collection("users"); < 컬렉션 이름
    // 1. 삽입 : fs.collection("users").add(map형태의 데이터); < 쿼리X 함수O
    // 2. 목록 : fs.collection("users").get();
    // 3. 수정 : fs.collection("users").update(map형태의 데이터);
    // 4. 삭제 : fs.collection("users").delete(map형태의 데이터);

    Future<void> addUser() async{
      Map<String, dynamic> user = {
        "name" : "김철수",
        "age" : 20,
        "cdate" : Timestamp.now()
      };
      await fs.collection("users").add(user);
      // await fs.collection("users").add({
      //   "name" : "김철수",
      //   "age" : 20,
      //   "cdate" : Timestamp.now()
      // });

      //  문서 ID 직접 넣는 경우 .doc()
      await fs.collection("users").doc("abdc").set(user);
    }

    Future<void> getUserList() async{
      // final snapshot = await fs.collection("users").get();
      final snapshot = await fs.collection("users")
          // .where("age", isGreaterThan: 20) // age > 20
          .where("age", isGreaterThanOrEqualTo: 25) // age >= 25
          // .orderBy("age") // age 필드 기준으로 오름차순
          .orderBy("age", descending: true) // age 핑드 기준으로 내림차순
          .get();

      // snapshot.docs 유저 조회!
      for(var doc in snapshot.docs){
        Map<String, dynamic> user = doc.data();
        print("문서 ID : ${doc.id}, 이름 : ${user["name"]}, 나이 : ${user["age"]}");
      }
    }
    // 유저 수정!
    Future<void> updateUser() async{
      fs.collection("users").doc("CPWuD0HL6SuUCCE3zYOU").update({
        "name" : "박영희",
        "age" : 25
      });
    }
    // 유저 삭제!
    Future<void> deleteUser() async{
      fs.collection("users").doc("CPWuD0HL6SuUCCE3zYOU").delete();
    }



    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: addUser,
                    child: Text("유저 추가!")
                ),
                ElevatedButton(
                    onPressed: getUserList,
                    child: Text("조회!")
                ),
                ElevatedButton(
                    onPressed: updateUser,
                    child: Text("수정!")
                ),
                ElevatedButton(
                    onPressed: deleteUser,
                    child: Text("삭제!")
                )
              ],
            )),
      ),
    );
  }
}
