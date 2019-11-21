//import 'lesson_model.dart';
import 'package:flutter/material.dart';
import 'prescription.dart';
import 'appTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:medibase1/Details_list.dart';
import 'Symptoms.dart';
import 'Diagnosis_UI.dart';
import 'Api_Model.dart';

class PatientDetails extends StatefulWidget {
  final Lesson lesson;


  PatientDetails({Key key, this.lesson}) : super(key: key);

  @override
  _PatientDetailsState createState() => _PatientDetailsState(lesson);
}

class _PatientDetailsState extends State<PatientDetails> {
  int _currentIndex = 0;
  PageController _pageController;
  Lesson lesson;
  _PatientDetailsState(this.lesson);



  @override
  void initState() {
    super.initState();
    _pageController = PageController();


  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    //  appBar: topContent,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: <Widget>[

          Symptoms(lesson: lesson,),
        diagnosis_report(lesson: lesson,),
          DetailPage(lesson: lesson),


        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        itemCornerRadius: 15,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: AppTheme.awesomeblue,
              inactiveColor: AppTheme.lightText,
              title: Text('SYMPTOMS',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,)),
              icon: Icon(FontAwesomeIcons.heartbeat)
          ),
          BottomNavyBarItem(
              activeColor: AppTheme.awesomeblue,
              inactiveColor: AppTheme.lightText,
              title: Text('DIAGNOSIS',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,)),
              icon: Icon(FontAwesomeIcons.stethoscope)
          ),
          BottomNavyBarItem(
              activeColor: AppTheme.awesomeblue,
              inactiveColor: AppTheme.lightText,
              title: Text('MEDICINE',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,)),
              icon: Icon(FontAwesomeIcons.pills)
          )
        ],
      ),
    );
  }

  // OPTIONAL APP BAR

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