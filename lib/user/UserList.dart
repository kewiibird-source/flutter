import 'package:flutter/material.dart';
import 'package:p1/user/UserEdit.dart';
import 'DB.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Map<String, dynamic>> list = [];

  Future<void> _selectUserList() async{ // _ 언더바는 프라이빗
     var tempList = await DB.selectUserList();
    setState(() {
      list = tempList;
    });
  }

  @override
  void initState() { // 처음최초실행
    // TODO: implement initState
    super.initState();
    _selectUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("사용자 목록"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var user = list[index];
          // Map<String, dynamic> user = list[index];
          return ListTile(
            leading: Icon(Icons.home),
            title: Text("아이디 : ${user["userId"]}, 이름 : ${user["name"]}"),
            subtitle: Text("나이 : ${user["age"]}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () async{
                      bool flg = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserEdit(userId : user["userId"]),
                          )
                      );
                      if(flg){ // flg가 true일때 유저목록 새로고침
                        _selectUserList();
                      }
                    },
                    icon: Icon(Icons.edit)
                ),
                IconButton(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("삭제"),
                            content: Text("${user['name']}님을 정말 삭제하시겠습니까?"),
                            actions: [
                              TextButton(
                                  onPressed: () async{
                                    // 삭제 끝난 뒤 dialog 닫힘 후 목록 새로고침
                                    await DB.deleteUser(user["userId"]);
                                    Navigator.of(context).pop();
                                    _selectUserList();
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

