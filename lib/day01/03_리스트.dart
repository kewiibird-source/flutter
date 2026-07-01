import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            ListTile(
              leading: Image.asset("img3.png"),
              title: Text("가나디 hi", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("가나디 귀여워~"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
            ),
            Divider(height: 3, color: Colors.black45,),
            ListTile(
              leading: Image.asset("img4.png"),
              title: Text("가나디 당황", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("가나디 당황띠~"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
            ),
            Divider(height: 3, color: Colors.black45,),
            ListTile(
              leading: Image.asset("img1.png"),
              title: Text("가나디 머쓱", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("가나디 머쓱띠~"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
            )
          ],
        ),
      ),
    );
  }
}
