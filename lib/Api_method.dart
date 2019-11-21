import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'Api_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<Lesson>> datainput() async {
  var user = await FirebaseAuth.instance.currentUser();
  String UID = user.email;
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse("http://10.6.15.177:3000/api/displayAll/"));
  request.headers.set('Content-type', 'application/json');
  request.add(utf8.encode(json.encode({ "patientUID": UID})));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  var parsedJson = json.decode(reply);
  print(parsedJson);
  httpClient.close();

  //Response response;
  //var json_patient_data;
  //print("JELO");
  //Dio dio = new Dio();
  //response = await dio.post("http://10.6.15.177:3000/api/displayAll/",
    //  data: { "patientUID": "6WLIX6FWj9gTCTPuf1vxFi4N3gm1"});
  //json_patient_data = response.data;
  //print(json_patient_data);
  //print("JELO");
  //var parsedJson = json.decode(json_patient_data.toString());
  PatientModel ourUser = PatientModel.fromJson(parsedJson[0]);
  print(ourUser.medibase.years[0].lessons[0].instituteName);
  var number_of_years = ourUser.medibase.years.length;
  print(number_of_years);
  List<List<Lesson>> list_lesson_list=[];
  for (int i = 0; i < number_of_years; i++) {
    list_lesson_list.add(ourUser.medibase.years[i].lessons);
  }
  List<Lesson> lesson_list=[];
  for (int j = 0; j < list_lesson_list.length; j++) {
    for (int k = 0; k < list_lesson_list[j].length; k++) {
      lesson_list.add(list_lesson_list[j][k]);
    }
  }
  //print(lesson_list);
  return lesson_list;
}


  //return lesson_list;

  //print('${user.name} is ${user.alias}');
  //print(response.data.toString());
//  String url =
//      'http://10.6.15.177:3000/api/displayAll/';
//  Map map = {
//    'data': {'patientUID': 'rTHDf5bLW0SjpMAndIAOxQEXxgB33'},
//  };
//
//  print(await apiRequest(url, map));

//
//Future<String> apiRequest(String url, Map jsonMap) async {
//  HttpClient httpClient = new HttpClient();
//  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
//  request.headers.set('content-type', 'application/json');
//  request.add(utf8.encode(json.encode(jsonMap)));
//  HttpClientResponse response = await request.close();
//  // todo - you should check the response.statusCode
//  String reply = await response.transform(utf8.decoder).join();
//  httpClient.close();
//  return reply;
//}