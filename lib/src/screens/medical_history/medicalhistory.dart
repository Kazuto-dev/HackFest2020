import 'package:chat_app/src/screens/drawer/AppDrawer.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Medical History")),
      body: body(context),
      drawer: AppDrawer(),
    );

  }

  Widget body(BuildContext context){
    return Center(
      child: Text("No Medical History yet.", style: TextStyle(color: Colors.black, fontSize: 20))
    );
  }

}
