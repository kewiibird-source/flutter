import 'package:flutter/material.dart';
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
          return ListTile(
            leading: Icon(Icons.home),
            title: Text("집 고고"),
            subtitle: Text("고고~~"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.edit),
                Icon(Icons.delete)
              ],
            ),
          );
        },
      ),
    );
  }
}

