import 'package:medibase1/appTheme.dart';
import 'package:medibase1/customDrawer/drawerUserController.dart';
import 'package:medibase1/customDrawer/homeDrawer.dart';
import 'package:medibase1/feedbackScreen.dart';
import 'package:medibase1/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:medibase1/profile.dart';
import 'package:medibase1/Aboutpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'medical_history.dart';



class NavigationHomeScreen extends StatefulWidget {

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
 // StateModel appState;
  String unique_identity="NULL";
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  void initState() {
    unique_identity=getuid();
    drawerIndex = DrawerIndex.HOME;
    screenView = MyHomePage();
    super.initState();
  }

  String getuid(){
    FirebaseAuth.instance.currentUser().then((user) {
      unique_identity = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false); //return a `Future` with false value so this route cant be popped or closed.
      },
      child: Container(
        color: AppTheme.nearlyWhite,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: AppTheme.nearlyWhite,
            body: DrawerUserController(
              screenIndex: drawerIndex,
              drawerWidth: 100,
              animationController: (AnimationController animationController) {
                sliderAnimationController = animationController;
              },
              onDrawerCall: (DrawerIndex drawerIndexdata) {
                changeIndex(drawerIndexdata);
              },
              screenView: screenView,
            ),
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.MedHistory) {
        setState(() {
          screenView = ListPage(title: "Your Previous Visits",);
        });}
      else if (drawerIndex == DrawerIndex.Profile) {
        setState(() {
          screenView = ProfileScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = AboutPage();
        });
      } else {
        //do in your way......
      }
    }
  }

  Widget texty(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
          //  unique_identity=snapshot.data.uid)
            return Text(snapshot.data.uid);
          }
          else {
            return Text('Loading...');
          }
        },
      ),
    );
  }


//  Widget _buildContent(BuildContext context) {
//    if (appState.isLoading) {
//      return _buildLoadingIndicator();
//    } else if (!appState.isLoading && appState.user == null) {
//      return new LoginScreen();
//    } else {
//      return build1(context);        // what context?
//    }
//  }
//
//  Center _buildLoadingIndicator() {
//    return Center(
//      child: new CircularProgressIndicator(),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // Build the content depending on the state:
//    appState = StateWidget.of(context).state;
//    return _buildContent(context);
//  }
}
