import 'package:chat_app/src/screens/about/about.dart';
import 'package:chat_app/src/screens/chats/chats.dart';
import 'package:chat_app/src/screens/directions/directions.dart';
import 'package:chat_app/src/screens/emergency/emergency.dart';
import 'package:chat_app/src/screens/home/HomeScreen.dart';
import 'package:chat_app/src/screens/medical_history/medicalhistory.dart';
import 'package:chat_app/src/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
// Add a ListView to the drawer. This ensures the user can scroll
// through the options in the drawer if there isn't enough vertical
// space to fit everything.
      child: ListView(
// Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  backgroundImage: NetworkImage("https://media.discordapp.net/attachments/781724525368180737/782378986688086036/Group_33.png"),
//                        backgroundImage: NetworkImage(image),
                ),
                SizedBox(height: 10,),
                Text('Hi Admin!', style: TextStyle(color: Colors.white, fontSize: 18),),
                Text("admin@gmail.com", style: TextStyle(color: Colors.white, fontSize: 14),),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),

          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())).then((value) => Navigator.pop(context));
            },
          ),
          ListTile(
            title: Text('Messages'),
            leading: Icon(Icons.email),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatListScreen())).then((value) => Navigator.pop(context));
            },
          ),
          ListTile(
            title: Text('Emergency'),
            leading: Icon(Icons.healing),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyScreen())).then((value) => Navigator.pop(context));
            },
          ),
          ListTile(
            title: Text('Directions'),
            leading: Icon(Icons.directions),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => DirectionScreen())).then((value) => Navigator.pop(context));
            },
          ),
          ListTile(
            title: Text('Medical History'),
            leading: Icon(Icons.content_paste),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen())).then((value) => Navigator.pop(context));
            },
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person_outline),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())).then((value) => Navigator.pop(context));
            },
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.help),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen())).then((value) => Navigator.pop(context));
            },
          ),
        ],
      ),
    );
  }
}