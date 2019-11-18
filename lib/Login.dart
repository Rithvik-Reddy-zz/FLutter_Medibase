import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:medibase1/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:medibase1/navigationHomeScreen.dart';
import 'Firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    print("Started APP");
    super.initState();
    if (FirebaseAuth.instance.currentUser() != null) {
      print("signed in");
//      Timer.run(() {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => NavigationHomeScreen()),
//        );
//      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 140),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 250,
                      width: 250,
                      child: Image(image: AssetImage('assets/images/logo.png')))
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.awesomeblue,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.0),
                        offset: Offset(4, 4),
                        blurRadius: 8.0),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                        Get_in();

//                      if (FirebaseAuth.instance.currentUser() != null) {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => NavigationHomeScreen()),
//                        );
//                      } else {

//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => NavigationHomeScreen()),
//                        );
//                            .whenComplete(() {
//                          Navigator.of(context).push(
//                            MaterialPageRoute(
//                              builder: (context) {
//                                return NavigationHomeScreen();
//                              },
//                            ),
//                          );
//                        });

                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.exit_to_app,
                              color: AppTheme.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Get_in() async{
    await signInWithGoogle();
    if (FirebaseAuth.instance.currentUser() == null) {
      print("Not signed in");
    }
    else {
      print("signed in");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NavigationHomeScreen()),
      );
    }
  }
}
