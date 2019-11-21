//import 'lesson_model.dart';
import 'package:flutter/material.dart';
import 'Api_Model.dart';
import 'diagnosis.dart';
import 'prescription.dart';
import 'appTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class diagnosis_report extends StatelessWidget {


  final Lesson lesson;

  diagnosis_report({Key key, this.lesson}) : super(key: key);


  @override
  Widget build(BuildContext context) {


// ------------------------------------------------------------------------------------------
  

    final makeBody = Center(
        child: Container(
      padding: EdgeInsets.only(top:100),
      child: Column(
        children: <Widget>[ListTile(
          contentPadding: EdgeInsets.all(20),

          title: Center(child: Text(lesson.diagnosis[0].condition,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30))),
        ),
    SizedBox(
    height: 30,
    ),
    ListTile(
        title: Center(child: Text("ADVICE")),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(lesson.diagnosis[0].advice),
        ),
        
      ),
      ])

      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
    ));

    return makeBody;
  }
}
