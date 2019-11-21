import 'package:medibase1/appTheme.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
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
                padding: EdgeInsets.only(
                    top: 50,
                    left: 16,
                    right: 16),
                child: Container(
                    height: 200,
                    child: Image.asset("assets/images/logo.png")),
              ),
              Container(
                padding: EdgeInsets.only(top:1),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "As a need to store records accurately and safely, we have introduced MEDiBase, a one stop solution to address all these problems. It stores medical data on a distributed network and provides patients with an interface to check their medical status.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                color: AppTheme.lightText,
                thickness: 1,
              ),
              Container(
                padding: EdgeInsets.only(top: 8,bottom: 8),
                child: Text(
                  'DEVELOPERS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(5),
                  leading:CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/userImage.png'),
                ),
                  title: Text("Rithvik Sallaram"),
                  subtitle: Text("Mobile App",),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(5),
                  leading:CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/Raghu.png'),
                  ),
                  title: Text("Hari Sai Raghuram"),
                  subtitle: Text("Backend",),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(5),
                  leading:CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/akhilesh.png'),
                  ),
                  title: Text("Akhilesh Pothuri"),
                  subtitle: Text("Website",),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


}
