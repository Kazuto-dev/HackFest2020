import 'package:chat_app/src/screens/drawer/AppDrawer.dart';
import 'package:chat_app/src/screens/emergency/add_emergency.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: homeBody(context),
      drawer: AppDrawer(),
    );

  }

  Widget homeBody(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmergency())).then((value) => Navigator.pop(context));
            },
            child: Image.asset("assets/icon/onetapready.png", width: 500, height: 400),
          ),
          Text("PRESS IN CASE OF EMERGENCY", style: TextStyle(color: Colors.black, fontSize: 20)),

        ],
      ),
    );
  }

}
