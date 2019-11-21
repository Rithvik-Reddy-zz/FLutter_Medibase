//import 'lesson_model.dart';
import 'package:flutter/material.dart';
//import 'prescription.dart';
import 'Api_Model.dart';
import 'appTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'medical_history.dart';
import 'PatientDetails.dart';

class MedicalHistory extends StatelessWidget {


  final List<Lesson> lessons;

  MedicalHistory({Key key, this.lessons}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(
          FontAwesomeIcons.hospital,
          color: AppTheme.awesomeblue,
          size: 40,
        ),
      ),
      title: Text(
        lesson.instituteName,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 17),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Padding(
          padding: EdgeInsets.only(left: 0.0, top: 10),
          child: Text(lesson.dateOfVisit.toString(), style: TextStyle(color: AppTheme.awesomeblue,fontWeight: FontWeight.w200,fontSize: 14))),

      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PatientDetails(lesson: lesson)));
      },
    );

    //----------------------------------------------------------------------------

    Card makeCard(Lesson lesson) => Card(
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
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    return makeBody;

  }

}
