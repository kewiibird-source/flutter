import 'package:flutter/material.dart';
import 'DB.dart';

class UserEdit extends StatefulWidget {
  final int userId;
  const UserEdit({super.key, required this.userId});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  @override
  void initState() {
    Future<void> _selectUser() async{
      var list = await DB.selectUser(widget.userId); // user = []
      var user = list.first; // list[0] fk검색할땐 first
      setState(() {
        nameCtrl.text = user["name"];
        ageCtrl.text = user["age"].toString(); // int형 => string형
      });
    }

    // TODO: implement initState
    super.initState();
    // print(widget.userId); // 상단 final userId에 접근(widget.)
    _selectUser(); // 유저 1인 검색 최초에 실행
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("사용자 수정"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                  labelText: "이름"
              ),
            ),
            TextField(
              controller: ageCtrl,
              decoration: InputDecoration(
                  labelText: "나이"
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  String name = nameCtrl.text;
                  int age = int.tryParse(ageCtrl.text) ?? 0;
                  await DB.updateUser(name, age, widget.userId);
                  Navigator.pop(context); // 수정 버튼 누르면 자동으로 뒤로가짐

                  nameCtrl.clear();
                  ageCtrl.clear();
                },
                child: Text("수정")
            )
          ],
        ),
      ),
    );
  }
}
