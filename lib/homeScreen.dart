import 'package:medibase1/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'getListFunction.dart';
//import 'lesson_model.dart';
import 'LatestPrescription.dart';
import 'package:dio/dio.dart';
import 'Api_Model.dart';
import 'Api_method.dart';
import 'dart:convert';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Lesson> Lesson_list;
   Lesson lastLesson;
  @override
  void initState() {
    datainput();
   // Lesson_list=getLessons();
   // lastLesson=Lesson_list.last;
//    Lesson_list=getLessons();
//    lastLesson = Lesson_list[Lesson_list.length-1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: Column(
            children: <Widget>[

              Container(
                padding: EdgeInsets.only(top: 80),
                child: name()
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 130.0),
                child: Text("Your Appointments",style: AppTheme.subtitle),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: AppTheme.drawerblue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(
                      color: AppTheme.lightText,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListTile(
                          trailing: Icon(
                            FontAwesomeIcons.clock,
                            color: AppTheme.white,
                            size: 25,
                          ),
                          title: Text("Tomorrow",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                          ),
                          subtitle:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("23rd November 2019, 1:00 PM",style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white ,
                            ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                        color: AppTheme.notWhite,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.hospital,
                            color: AppTheme.white,
                            size: 20,
                          ),
                          title:  Text("Sunshine Hospital",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                        ),
                          subtitle:Text("Hyderabad",style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                      ),


                    ],
                  ),
                ),



              ),
              Padding(
                padding: const EdgeInsets.only(right: 130.0),
                child: Text("Recent Prescription",style: AppTheme.subtitle),
              ),

              Container(
                child: FutureBuilder(
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
                      return Latestprescription(lesson: snapshot.data.last);
                    }
                  },
                ),
              )
            //  DetailPage(lesson: lastLesson)


            ],
          ),
        ),
      ),
    );
  }


  Widget name() {     // Name Display
    return Container(
      child: FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return Text("Hello "+
                snapshot.data.displayName+"\n How are you Today?",
                style: TextStyle(
                  color: AppTheme.lightText,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                )
            );//snapshot.data.uid);
          }
          else {
            return Text('Loading...');
          }
        },
      ),
    );
  }

}

//
//Container(
//height: 250,
//child://FutureBuilder(builder: null)
//Latestprescription(lesson: lastLesson,)
//)