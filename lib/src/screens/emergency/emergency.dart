import 'dart:async';
import 'dart:collection';

import 'package:chat_app/src/screens/drawer/AppDrawer.dart';
import 'package:chat_app/src/screens/models/RequestModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmergencyScreen extends StatefulWidget {
  EmergencyScreen({Key key,}) : super(key: key);
  @override
  EmergencyScreenState createState() => EmergencyScreenState();
}

class EmergencyScreenState extends State<EmergencyScreen>{
  final inputController = TextEditingController();
  DatabaseReference itemRef;
  StreamSubscription<Event> _onRequestAddedSubscription;
  StreamSubscription<Event> _onRequestChangedSubscription;

  Query _todoQuery;

  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  SharedPreferences prefs;

  bool submitted = false,
      confirmed = false,
      otw = false,
      arrived = false,
      complete = false;
  String uid;

  @override
  void initState() {
    super.initState();
    initSharedPref();
    itemRef = FirebaseDatabase.instance.reference().child("request");
    _todoQuery = firebaseDatabase.reference().child("request");
    _onRequestAddedSubscription = _todoQuery.onChildAdded.listen(onEntryAdded);
    _onRequestChangedSubscription = _todoQuery.onChildChanged.listen(onEntryChanged);

  }

  initSharedPref() async{
    prefs = await SharedPreferences.getInstance();

    uid = prefs.getString("uid") ?? "";
  }

  onEntryAdded(Event event) {
    if(event.snapshot.key == uid) {
      if (event.snapshot.value["status_request"] == "submitted") {
        setState(() {
          submitted = true;
        });
      }
      if (event.snapshot.value["status_confirmed"] == "confirmed") {
        setState(() {
          confirmed = true;
        });
      }
      if (event.snapshot.value["status_otw"] == "otw") {
        setState(() {
          otw = true;
        });
      }
      if (event.snapshot.value["status_arrived"] == "arrived") {
        setState(() {
          arrived = true;
        });
      }
      if (event.snapshot.value["status_complete"] == "complete") {
        setState(() {
          complete = true;
        });
      }
    }
  }

  onEntryChanged(Event event) {

    if(event.snapshot.key == uid){


    if(event.snapshot.value["status_request"] == "submitted"){
      setState(() {
        submitted = true;
      });
    }
    if(event.snapshot.value["status_confirmed"] == "confirmed"){
      setState(() {
        confirmed = true;
      });
    }
    if(event.snapshot.value["status_otw"] == "otw"){
      setState(() {
        otw = true;
      });
    }
    if(event.snapshot.value["status_arrived"] == "arrived"){
      setState(() {
        arrived = true;
      });
    }
    if(event.snapshot.value["status_complete"] == "complete"){
      setState(() {
        complete = true;
      });
    }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emergency Tracker")),
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
              padding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
              width: 400,
              child:  ListTile(
                leading: submitted == true ? Image.asset("assets/icon/greencheck.png", width: 30, height: 30) : Image.asset("assets/icon/blankcheck.png", width: 30, height: 30),
                title: Text("Request Submitted", style: new TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Colors.green,
                )),
                onTap: () {},
              ),
          ),
          Container(
            padding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
            width: 400,
            child:  ListTile(
              leading: confirmed == true ? Image.asset("assets/icon/greencheck.png", width: 30, height: 30) : Image.asset("assets/icon/blankcheck.png", width: 30, height: 30),
              title: Text("Confirmed Request", style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                color: Colors.green,
              )),
              onTap: () {},
            ),
          ),
          Container(
            padding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
            width: 400,
            child:  ListTile(
              leading: otw == true ? Image.asset("assets/icon/greencheck.png", width: 30, height: 30) : Image.asset("assets/icon/blankcheck.png", width: 30, height: 30),
              title: Text("Respondent is on the way!", style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                color: Colors.green,
              )),
              onTap: () {},
            ),
          ),
          Container(
            padding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
            width: 400,
            child:  ListTile(
              leading: arrived == true ? Image.asset("assets/icon/greencheck.png", width: 30, height: 30) : Image.asset("assets/icon/blankcheck.png", width: 30, height: 30),
              title: Text("Respondent Arrived at Scene", style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                color: Colors.green,
              )),
              onTap: () {},
            ),
          ),
          Container(
            padding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
            width: 400,
            child:  ListTile(
              leading: complete == true ? Image.asset("assets/icon/greencheck.png", width: 30, height: 30) : Image.asset("assets/icon/blankcheck.png", width: 30, height: 30),
              title: Text("Complete", style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                color: Colors.green,
              )),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

}
