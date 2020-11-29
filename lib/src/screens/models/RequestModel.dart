
import 'package:firebase_database/firebase_database.dart';

class RequestModel{
  String key;
  String userName;
  String requestType;
  String openingTime;
  String closingTime;
  String address;
  String imageLink;
  String lat;
  String lng;
  String status_request;
  String status_confirmed;
  String status_otw;
  String status_arrived;
  String status_complete;

  RequestModel(
      this.userName,
      this.requestType,
      this.openingTime,
      this.closingTime,
      this.address,
      this.imageLink,
      this.lat,
      this.lng,
      this.status_request,
      this.status_confirmed,
      this.status_otw,
      this.status_arrived,
      this.status_complete,
      );

  RequestModel.fromJson(DataSnapshot json) :
        key = json.key,
        userName = json.value['userName'],
        requestType = json.value['requestType'],
        openingTime = json.value['openingTime'],
        closingTime = json.value['closingTime'],
        address = json.value['address'],
        imageLink = json.value['imageLink'],
        lat = json.value['lat'],
        lng = json.value['lng'],
        status_request = json.value['status_request'],
        status_confirmed = json.value['status_confirmed'],
        status_otw = json.value['status_otw'],
        status_arrived = json.value['status_arrived'],
        status_complete = json.value['status_complete'];


  toJson(){
    return {
      "userName": userName,
      "requestType": requestType,
      "openingTime": openingTime,
      "closingTime": closingTime,
      "address": address,
      "imageLink": imageLink,
      "lat": lat,
      "lng": lng,
      "status_request": status_request,
      "status_confirmed": status_confirmed,
      "status_otw": status_otw,
      "status_arrived": status_arrived,
      "status_complete": status_complete,
    };
  }
}