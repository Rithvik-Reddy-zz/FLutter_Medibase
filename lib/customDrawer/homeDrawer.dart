import 'package:medibase1/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:medibase1/Firebase_auth.dart';

class HomeDrawer extends StatefulWidget {
  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBackIndex;
  HomeDrawer(
      {Key key, this.screenIndex, this.iconAnimationController, this.callBackIndex})
      : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<DrawerList> drawerList;
  @override
  void initState() {
    setdDrawerListArray();
    super.initState();
  }

  void setdDrawerListArray() {
    drawerList = [
      DrawerList(
        index: DrawerIndex.Profile,
        labelName: 'Profile',
        icon: new Icon(Icons.account_circle),
      ),
      DrawerList(
        index: DrawerIndex.HOME,
        labelName: 'Home',
        icon: new Icon(Icons.home),
      ),
      DrawerList(
        index: DrawerIndex.MedHistory,
        labelName: 'History',
        icon: new Icon(Icons.history)
      ),
      DrawerList(
        index: DrawerIndex.FeedBack,
        labelName: 'FeedBack',
        icon: new Icon(Icons.help),
      ),
      DrawerList(
        index: DrawerIndex.About,
        labelName: 'About',
        icon: new Icon(Icons.subject),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: AppTheme.white.withOpacity(0),
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
//            Container(
//              width: double.infinity,
//              padding: EdgeInsets.only(top: 10.0),
//              child: Container(
//                padding: EdgeInsets.all(16.0),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    AnimatedBuilder(
//                      animation: widget.iconAnimationController,
//                      builder: (BuildContext context, Widget child) {
//                        return new ScaleTransition(
//                          scale: new AlwaysStoppedAnimation(
//                              1.0 - (widget.iconAnimationController.value) * 0.2),
//                          child: Container(
//                            height: 120,
//                            width: 120,
//                            decoration: BoxDecoration(
//                              shape: BoxShape.circle,
//                              boxShadow: <BoxShadow>[
//                                BoxShadow(
//                                    color: AppTheme.grey.withOpacity(0.6),
//                                    offset: Offset(2.0, 4.0),
//                                    blurRadius: 8),
//                              ],
//                            ),
//                            child: ClipRRect(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(60.0)),
//                              child: Image.asset("assets/images/userImage.png"),
//                            ),
//                          ),
//                        );
//                      },
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top: 8, left: 4),
//                      child: Text(
//                        "Rithvik Sallaram",
//                        style: TextStyle(
//                          fontWeight: FontWeight.w600,
//                          color: AppTheme.grey,
//                          fontSize: 18,
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              height: 90,
              color: AppTheme.grey.withOpacity(0),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(0.0),
                itemCount: drawerList.length,
                itemBuilder: (context, index) {
                  return inkwell(drawerList[index]);
                },
              ),
            ),
            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(0),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xFFFD876E)
              ),
              child: InkWell(
                  onTap: (){
                    signOutGoogle();
                    Navigator.pop(context);
                    print("Sign out");//Sign Out
                  },
                  child: Icon(Icons.power_settings_new))
              // Sign OUT
              ),
          ],
        ),
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoScreen(listData.index);
        },
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 27.0, bottom: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
//                  Container(
//                    width: 6.0,
//                    height: 46.0,
//                    // decoration: BoxDecoration(
//                    //   color: widget.screenIndex == listData.index
//                    //       ? Colors.blue
//                    //       : Colors.transparent,
//                    //   borderRadius: new BorderRadius.only(
//                    //     topLeft: Radius.circular(0),
//                    //     topRight: Radius.circular(16),
//                    //     bottomLeft: Radius.circular(0),
//                    //     bottomRight: Radius.circular(16),
//                    //   ),
//                    // ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.all(4.0),
//                  ),
                      new Icon(listData.icon.icon,
                              color: widget.screenIndex == listData.index
                                  ? Colors.white
                                  : AppTheme.nearlyBlack),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                      ),
                      new Text(
                        listData.labelName,
                        style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: widget.screenIndex == listData.index
                              ? Colors.white
                              : AppTheme.nearlyBlack,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
//              widget.screenIndex == listData.index
//                  ? AnimatedBuilder(
//                      animation: widget.iconAnimationController,
//                      builder: (BuildContext context, Widget child) {
//                        return new Transform(
//                          transform: new Matrix4.translationValues(
//                              (MediaQuery.of(context).size.width * 0.75 - 64) *
//                                  (1.0 -
//                                      widget.iconAnimationController.value -
//                                      1.0),
//                              0.0,
//                              0.0),
//                          child: Padding(
//                            padding: EdgeInsets.only(top: 8, bottom: 8,left: 10),
//                            child: Container(
//                              width:
//                                  MediaQuery.of(context).size.width * 0.75 - 64,
//                              height: 46,
//                              decoration: BoxDecoration(
//                                color: Colors.white.withOpacity(0.0),
//                                borderRadius: new BorderRadius.only(
//                                  topLeft: Radius.circular(28),
//                                  topRight: Radius.circular(28),
//                                  bottomLeft: Radius.circular(28),
//                                  bottomRight: Radius.circular(28),
//                                ),
//                              ),
//                            ),
//                          ),
//                        );
//                      },
//                    )
                  //,SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  void navigationtoScreen(DrawerIndex indexScreen) async {
    widget.callBackIndex(indexScreen);
  }
}

enum DrawerIndex {
  Profile,
  HOME,
  FeedBack,
  MedHistory,
  About
}

class DrawerList {
  String labelName;
  Icon icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex index;

  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.imageName = '',
  });
}
