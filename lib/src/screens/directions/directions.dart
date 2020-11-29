import 'package:chat_app/src/screens/drawer/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionScreen extends StatefulWidget {
  DirectionScreen({Key key,}) : super(key: key);
  @override
  DirectionScreenState createState() => DirectionScreenState();
}

class DirectionScreenState extends State<DirectionScreen>{
  final inputController = TextEditingController();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Directions")),
      body: body(context),
      drawer: AppDrawer(),
    );

  }


  Widget body(BuildContext context){
    return Container(
        width: 500,
        height: 700,
        child: PlacePicker(
          apiKey: "AIzaSyAxijw2c8k2m8Aq1UCrr9EZYYEC4_59MH8",
          initialPosition: LatLng(_currentPosition.latitude, _currentPosition.longitude),
          useCurrentLocation: true,
          onPlacePicked: (result){

            setState(() {

            });
          },
        )
    );
  }

}
