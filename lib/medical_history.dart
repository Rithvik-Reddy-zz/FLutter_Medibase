//import 'lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:medibase1/Details_list.dart';
import 'appTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'prescription.dart';
import 'diagnosis.dart';
import 'PatientDetails.dart';
//import 'getListFunction.dart';
import 'package:dio/dio.dart';
import 'Api_Model.dart';
import 'dart:convert';
import 'dart:async';
import 'MedHistoryUI.dart';
import 'Api_method.dart';
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      theme: new ThemeData(
//          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
//      home: new ListPage(title: 'Lessons'),
//      // home: DetailPage(),
//    );
//  }
//}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    //datainput();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

//    ListTile makeListTile(Lesson lesson) => ListTile(
//          contentPadding:
//              EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
//          leading: Container(
//            padding: EdgeInsets.only(right: 12.0),
//            decoration: new BoxDecoration(
//                border: new Border(
//                    right: new BorderSide(width: 1.0, color: Colors.white24))),
//            child: Icon(
//              FontAwesomeIcons.hospital,
//              color: AppTheme.awesomeblue,
//              size: 40,
//            ),
//          ),
//          title: Text(
//            lesson.instituteName,
//            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 17),
//          ),
//          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
//
//          subtitle: Padding(
//              padding: EdgeInsets.only(left: 0.0, top: 10),
//              child: Text(lesson.dateOfVisit.toString(), style: TextStyle(color: AppTheme.awesomeblue,fontWeight: FontWeight.w200,fontSize: 14))),
//
//          trailing:
//              Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
//          onTap: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => PatientDetails(lesson: lesson)));
//          },
//        );
//
//    //----------------------------------------------------------------------------
//
//    Card makeCard(Lesson lesson) => Card(
//          elevation: 0.0,
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(5.0),
//            side: BorderSide(
//              color: AppTheme.lightText,
//              width: 1.0,
//            ),
//          ),
//          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//          child: Container(
//            decoration: BoxDecoration(color: Colors.white),
//            child: makeListTile(lesson),
//          ),
//        );
//
//    final makeBody = Container(
//      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
//      child: ListView.builder(
//        scrollDirection: Axis.vertical,
//        shrinkWrap: true,
//        itemCount: lessons.length,
//        itemBuilder: (BuildContext context, int index) {
//          return makeCard(lessons[index]);
//        },
//      ),
//    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Center(
          child: Text(
        widget.title,
        style: TextStyle(color: Colors.black),
      )),
      automaticallyImplyLeading: false,
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.list),
//          onPressed: () {},
////        )
////      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      body: FutureBuilder(
        future: datainput(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          print(snapshot.data);
          if(snapshot.data == null){
            return Container(
                child: Center(
                    child: Text("Loading...")
                )
            );
          } else {
            return MedicalHistory(lessons: snapshot.data,);
          }
        },
      ),
        // bottomNavigationBar: makeBottom,
    );
  }

}



//List getLessons() {
//  return [
//    Lesson(
//      title: "Sunshine Hospital",
//      date: "2nd November 2019",
//      list_of_symptoms:["Chills", "Sweating", "dehydration", "headache", "muscle aches and pains", "a feeling of weakness", "loss of appetite"],
//      diagnosis: Diagnosis(
//          condition: "Viral Fever",
//          advice: "A viral fever is a sign that your body is working hard to fight off an infection. Cut yourself some slack by resting as much as possible. Even if you can’t spend the day in bed, try to avoid as much physical activity as possible. Aim for eight to nine hours or more of sleep per night. During the day, take it easy. People sometimes try herbal remedies to treat a fever. Keep in mind that these supplements have been shown to improve fever in animals. There’s no reliable evidence that they work in humans. Their safety in children is often unclear or unknown, too. It’s best to avoid these remedies in children. "
//      ),
//
//      list_of_prescriptions: [
//        Prescription(
//            name: "Penicillin 100mg Tablets",
//            type: "Anti-Pyretic",
//            dosage: "2 Pills",
//            duration: "4 days"),
//        Prescription(
//            name: "Crocin 50mg Tablets",
//            type: "Anti-Pyretic",
//            dosage: "2 Pills",
//            duration: "4 days")
//      ],
//    ),
//    Lesson(
//      title: "Appolo Hospital",
//      date: "15th November 2019",
//      list_of_symptoms:["Chills", "Sweating", "dehydration", "headache", "muscle aches and pains", "a feeling of weakness", "loss of appetite"],
//      diagnosis:
//      Diagnosis(
//          condition: "Viral Fever",
//          advice: "A viral fever is a sign that your body is working hard to fight off an infection. Cut yourself some slack by resting as much as possible. Even if you can’t spend the day in bed, try to avoid as much physical activity as possible. Aim for eight to nine hours or more of sleep per night. During the day, take it easy. People sometimes try herbal remedies to treat a fever. Keep in mind that these supplements have been shown to improve fever in animals. There’s no reliable evidence that they work in humans. Their safety in children is often unclear or unknown, too. It’s best to avoid these remedies in children. "
//      )
//      ,
//      list_of_prescriptions: [
//        Prescription(
//            name: "Meth 100mg Tablets",
//            type: "Anti-Pyretic",
//            dosage: "2 Pills",
//            duration: "4 days"),
//        Prescription(
//            name: "Ibuprofin 50mg Tablets",
//            type: "Pain Reliever",
//            dosage: "1 Pills",
//            duration: "7 days")
//      ],
//    ),
//    Lesson(
//      title: "Star Hospital",
//      date: "16th November 2019",
//      list_of_symptoms:["Sweating", "dehydration", "headache", "muscle aches and pains", "a feeling of weakness", "loss of appetite"],
//      diagnosis:
//      Diagnosis(
//          condition: "Bacterial Fever",
//          advice: "A viral fever is a sign that your body is working hard to fight off an infection. Cut yourself some slack by resting as much as possible. Even if you can’t spend the day in bed, try to avoid as much physical activity as possible. Aim for eight to nine hours or more of sleep per night. During the day, take it easy. People sometimes try herbal remedies to treat a fever. Keep in mind that these supplements have been shown to improve fever in animals. There’s no reliable evidence that they work in humans. Their safety in children is often unclear or unknown, too. It’s best to avoid these remedies in children. "
//      )
//      ,
//      list_of_prescriptions: [
//        Prescription(
//            name: "Meth 100mg Tablets",
//            type: "Anti-Pyretic",
//            dosage: "2 Pills",
//            duration: "4 days"),
//        Prescription(
//            name: "Ibuprofin 50mg Tablets",
//            type: "Pain Reliever",
//            dosage: "1 Pills",
//            duration: "7 days"),
//        Prescription(
//            name: "Ibuprofinaa 50mg Tablets",
//            type: "Pain Reliever",
//            dosage: "1 Pills",
//            duration: "7 days")
//      ],
//
//    )
//  ];
//}