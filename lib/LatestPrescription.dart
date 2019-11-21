//import 'lesson_model.dart';
import 'package:flutter/material.dart';
//import 'prescription.dart';
import 'Api_Model.dart';
import 'appTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'medical_history.dart';

class Latestprescription extends StatelessWidget {


  final Lesson lesson;

  Latestprescription({Key key, this.lesson}) : super(key: key);


  @override
  Widget build(BuildContext context) {


//    final topContent = AppBar(
//      elevation: 0.1,
//      backgroundColor: Colors.white,
//      title: Center(
//          child: Text(
//            "YOUR PRESCRIPTION",
//            style: TextStyle(color: Colors.black),
//          )),
//      automaticallyImplyLeading: false,
////      actions: <Widget>[
////        IconButton(
////          icon: Icon(Icons.list),
////          onPressed: () {},
////        )
////      ],
//    );

// ------------------------------------------------------------------------------------------

    Container makeListTile(Prescription prescription) => Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[Icon(
            FontAwesomeIcons.pills,
            color: AppTheme.awesomeblue,
            size: 40,
          ),
            Tile_elements(title: prescription.medication,value: prescription.type,)],
        ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: AppTheme.lightText,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Tile_elements(title: "Duration",value: prescription.duration,),
              Tile_elements(title:  "Pills per day",value: prescription.doseage,)
            ],
          )
        ],
      ),
    );


    Card makeCard(Prescription prescription) => Card(
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
        child: makeListTile(prescription),
      ),
    );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lesson.prescription.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lesson.prescription[index]);
        },
      ),
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
    );


    final topContent = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Center(
          child: Text(
            "PRESCRIPTION",
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


    return makeBody;

  }
}


class Tile_elements extends StatelessWidget {
  Tile_elements({@required this.title,this.value});

  final String title;
  final String value;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w200,
                color: AppTheme.awesomeblue),
          ),
        )
      ],
    );
  }
}







//
//
//ListTile(
//contentPadding:
//EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
//leading: Container(
//padding: EdgeInsets.only(right: 12.0),
//decoration: new BoxDecoration(
//border: new Border(
//right: new BorderSide(width: 1.0, color: Colors.white24))),
//child: Icon(FontAwesomeIcons.hospital, color: AppTheme.awesomeblue,size: 40,),
//),
//title: Text(
//prescription.title,
//style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
//),
//// subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
//
//subtitle: Padding(
//padding: EdgeInsets.only(left: 0.0,top: 10),
//child: Text(prescription.level,
//style: TextStyle(color: Colors.black))),
//
//
//
//trailing:
//Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
//onTap: () {
//Navigator.push(
//context,
//MaterialPageRoute(
//builder: (context) => DetailPage(lesson: prescription)));
//},
//);
