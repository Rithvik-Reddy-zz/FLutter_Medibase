import 'dart:io';
import 'package:medibase1/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'navigationHomeScreen.dart';
import 'Login.dart';
import 'package:medibase1/homeScreen.dart';


void main() {
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(new MyApp()));
  // runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home:LoginScreen()
    );
  }
}


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
//
//class LoginButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder(
//        stream: authService.user,
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            return NavigationHomeScreen();
////              MaterialButton(
////              onPressed: () => authService.signOut(),
////              color: Colors.red,
////              textColor: Colors.white,
////              child: Text('Signout'),
////            );
//          } else {
//            return LoginScreen();
////            MaterialButton(
////              onPressed: () => authService.googleSignIn(),
////              color: Colors.white,
////              textColor: Colors.black,
////              child: Text('Login with Google'),
////            );
//          }
//        });
//  }
//}