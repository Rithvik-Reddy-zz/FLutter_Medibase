import 'package:medibase1/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              profile_picture(),
//              CircleAvatar(
//                radius: 70,
//                backgroundImage: AssetImage('assets/images/userImage.png'),
//              ),
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Display_name()
              ),
              Container(
                padding: EdgeInsets.only(top: 3),
                child: uid()
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                    child: Center(
                        child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Pdetails(title: "Blood",value: "B+"),
                          Pdetails(title: "Height",value: "170cm"),
                          Pdetails(title: "Weight",value: "75kg")
                        ],
                      ),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Pdetails(title: "Gender",value: "Male"),
                            Pdetails(title: "Location",value: "Hyderabad"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppTheme.awesomeblue,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            offset: Offset(4, 4),
                            blurRadius: 8.0),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              'Update',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
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
      ),
    );
  }
  Widget Display_name() {     // Name Display
    return Container(
      child: FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return Text(
                snapshot.data.displayName,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ));//snapshot.data.uid);
          }
          else {
            return Text('Loading...');
          }
        },
      ),
    );
  }
  Widget uid() {     // Name Display
    return Container(
      child: FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return Text(
                snapshot.data.uid,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.lightText)
            );//snapshot.data.uid);
          }
          else {
            return Text('Loading...');
          }
        },
      ),
    );
  }

  Widget profile_picture() {     // DP
    return Container(
      child: FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(snapshot.data.photoUrl.toString()),
            );
//snapshot.data.uid);
          }
          else {
            return Text('Loading...');
          }
        },
      ),
    );
  }
}

class Pdetails extends StatelessWidget {
  Pdetails({@required this.title,this.value});

  final String title;
  final String value;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
              color: AppTheme.awesomeblue),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}

