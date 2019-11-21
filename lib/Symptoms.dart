//import 'lesson_model.dart';
import 'Api_Model.dart';
import 'package:flutter/material.dart';
import 'prescription.dart';
import 'appTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Symptoms extends StatelessWidget {


  final Lesson lesson;

  Symptoms({Key key, this.lesson}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    

// ------------------------------------------------------------------------------------------

    ListTile makeListTile(String symptom) => ListTile(
      contentPadding: EdgeInsets.all(11),
      leading: Icon(
            FontAwesomeIcons.heartbeat,
            color: AppTheme.awesomeblue,
            size: 20,
          ),
        title: Text(symptom,style: TextStyle(fontWeight: FontWeight.w300),)

    );


    Card makeCard(Problems symptom) => Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(
          color: AppTheme.lightText,
          width: 1.0,
        ),
      ),
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTile(symptom.symptom),
      ),
    );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lesson.problems.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lesson.problems[index]);
        },
      ),


      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
    );

    final topContent = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Center(
          child: Text(
            "SYMPTOMS",
            style: TextStyle(color: Colors.black54),
          )),
      automaticallyImplyLeading: false,
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.list),
//          onPressed: () {},
//        )
//      ],
    );

    return Scaffold(
      appBar: topContent,
      body: makeBody,
    )
    ;
  }
}
