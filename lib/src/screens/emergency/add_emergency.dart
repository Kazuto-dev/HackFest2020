import 'dart:collection';

import 'package:chat_app/src/screens/drawer/AppDrawer.dart';
import 'package:chat_app/src/screens/emergency/emergency.dart';
import 'package:chat_app/src/screens/models/RequestModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AddEmergency extends StatefulWidget {

  AddEmergency({Key key,}) : super(key: key);
  @override
  AddEmergencyState createState() => AddEmergencyState();
}

class AddEmergencyState extends State<AddEmergency>{
  final inputController = TextEditingController();
  bool gastroenteritis = false,
      stroke = false,
      hypertension = false,
      ventricularAccident = false,
      others = false;
  DatabaseReference itemRef;
  SharedPreferences prefs;
  String uid;

  @override
  void initState() {
    super.initState();
    initSharedPref();
    itemRef = FirebaseDatabase.instance.reference().child("request");
  }

  initSharedPref() async{
    prefs = await SharedPreferences.getInstance();

    uid = prefs.getString("uid") ?? "";
  }

  postRequest(){
    RequestModel requestData = new RequestModel(
        "test",
        "test",
        "test",
        "test",
        "test",
        "test",
        "test",
        "test",
        "submitted",
        "test123",
        "test123",
        "test",
        "test"
    );

    Map<String, dynamic> childNotifUpdate = new HashMap<String, dynamic>();
    childNotifUpdate.putIfAbsent(uid, () => requestData.toJson());

    itemRef.update(childNotifUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Emergency")),
      body: homeBody(context),
      drawer: AppDrawer(),
    );

  }

  Widget homeBody(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Container(
            width: 300,
            child:  CheckboxListTile(
              title: Text("Gastroenteritis", style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                color: Colors.green,
              )), //    <-- label
              value: gastroenteritis,
              onChanged: (bool newValue) {
                setState(() {
                  gastroenteritis = newValue;
                });
              },
            )
          ),
          Container(
            width: 300,
              child:  CheckboxListTile(
                title: Text("Cerebral/Heart Stroke", style: new TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Colors.green,
                )), //    <-- label
                value: stroke,
                onChanged: (bool newValue) {
                  setState(() {
                    stroke = newValue;
                  });
                },
              )
          ),
          Container(
            width: 300,
              child:  CheckboxListTile(
                title: Text("Hypertension", style: new TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Colors.green,
                )), //    <-- label
                value: hypertension,
                onChanged: (bool newValue) {
                  setState(() {
                    hypertension = newValue;
                  });
                },
              )
          ),
          Container(
            width: 300,
              child:  CheckboxListTile(
                title: Text("Ventricular Accident", style: new TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Colors.green,
                )), //    <-- label
                value: ventricularAccident,
                onChanged: (bool newValue) {
                  setState(() {
                    ventricularAccident = newValue;
                  });
                },
              )
          ),
          Container(
            width: 300,
              child:  CheckboxListTile(
                title: Text("Others", style: new TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Colors.green,
                )), //    <-- label
                value: others,
                onChanged: (bool newValue) {
                  setState(() {
                    others = newValue;
                  });
                },
              )
          ),
          SizedBox(height: 10,),
          Container(
              width: 300,
              child:  InkWell(
                onTap: () {
                  postRequest();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyScreen())).then((value) => Navigator.pop(context));
                },
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.green,
                      ), borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Text(
                      'SEND REQUEST',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }

}
