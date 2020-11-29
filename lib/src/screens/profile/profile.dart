import 'package:chat_app/src/constants/custom_dialog.dart';
import 'package:chat_app/src/screens/drawer/AppDrawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key,}) : super(key: key);
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>{
  final inputController = TextEditingController();

  String lName = "admin", fName = "admin", email = "admin@gmail.com", address = "NCR", password = "123", confirmPassword = "123";
  DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: body(context),
      drawer: AppDrawer(),
    );

  }

  Widget body(BuildContext context){
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Form(
                  //key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: Consts.avatarRadius,
//                          backgroundImage: NetworkImage(image),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('First Name*', style: TextStyle(fontSize: 16),),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        initialValue: fName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        onSaved: (value) => fName = value,
                        validator: (value) {
                          fName = value;
                          return value.isEmpty
                              ? 'First name cannot be blank'
                              : null;
                        },
                        decoration:
                        InputDecoration(hintText: "Type here"),
                      ),
                      SizedBox(height: 20),
                      Text('Last Name*', style: TextStyle(fontSize: 16),),
                      TextFormField(
                        initialValue: lName,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        onSaved: (value) => lName = value,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          lName = value;
                          return value.isEmpty
                              ? 'Last name cannot be blank'
                              : null;
                        },
                        decoration:
                        InputDecoration(hintText: "Type here"),
                      ),
                      SizedBox(height: 20),
                      Text('Email Address*', style: TextStyle(fontSize: 16),),
                      TextFormField(
                        initialValue: email,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        onSaved: (value) => email = value,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          email = value;
                          return value.isEmpty
                              ? 'Email address cannot be blank'
                              : null;
                        },
                        decoration:
                        InputDecoration(hintText: "Type here"),
                      ),
                      SizedBox(height: 20),
                      Text('Address*', style: TextStyle(fontSize: 16),),
                      TextFormField(
                        initialValue: address,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        onSaved: (value) => address = value,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          address = value;
                          return value.isEmpty
                              ? 'Address cannot be blank'
                              : null;
                        },
                        decoration:
                        InputDecoration(hintText: "Type here"),
                      ),
                      SizedBox(height: 20),
                      Text('Birth Date*', style: TextStyle(fontSize: 16),),
                      Row(
                        children: [
                          //Text("${selectedDate == null ? profileModel.bdate : selectedDate.toLocal()}".split(' ')[0]),
                          Text("Birthdate"),
                          SizedBox(width: 20.0,),
                          Ink(
//                              decoration: const ShapeDecoration(
//                                color: Colors.lightBlue,
//                                shape: CircleBorder(),
//                              ),
                            child: IconButton(
                              icon: Icon(Icons.calendar_today),
                              color: Colors.green,
                              onPressed: () => {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }

}
