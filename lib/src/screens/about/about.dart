import 'package:chat_app/src/constants/colors.dart';
import 'package:chat_app/src/constants/gradients.dart';
import 'package:chat_app/src/screens/drawer/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: body(context),
      drawer: AppDrawer(),
    );
  }

  Widget appBarComponent(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
          child: Row(
        children: <Widget>[
          Container(
            width: 90,
            height: 80,
            padding: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              gradient: BLUE_GRADIENT,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: WHITE_COLOR,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      )),
    );
  }

  Widget body(context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: ListView(
        children: <Widget>[
          headerComponent(),
          Container(margin: EdgeInsets.only(top: 40)),
          descriptionComponent(),
        ],
      ),
    );
  }

  Widget headerComponent() {
    return Text("OneTap", style: TextStyle(fontSize: 36));
  }

  Widget descriptionComponent() {
    return Text(
      "OneTap is an 'all in one' emergency app used for quick response in medical emergencies. The concept of one tap is from the idea of one of the developers: 'how can I help in rescue someone in the middle of pandemic when sometimes even 911 fails to do its job?'",
      style: TextStyle(
        fontSize: 19,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
