import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:relaxify/assessment.dart';
import 'package:relaxify/events.dart';
import 'package:relaxify/media.dart';
import 'package:relaxify/social/post.dart';
import 'package:relaxify/social/upload.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Dialog
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Facing Any Problem?"),
          content: new Text("Email : relaxify-help@gmail.com"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple.shade400,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: ClipOval(
              // ignore: deprecated_member_use
              child: Image.network(_firebaseAuth.currentUser.photoUrl),
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: Text(
          "Relaxify",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                "${_firebaseAuth.currentUser.displayName}",
              ),
              accountEmail: new Text("${_firebaseAuth.currentUser.email}"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("${_firebaseAuth.currentUser.displayName[0]}"),
              ),
            ),
            new ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.dashboard),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            new ListTile(
              title: new Text("Events"),
              trailing: new Icon(Icons.calendar_today),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Events()));
              },
            ),
            new ListTile(
              title: new Text("About The App"),
              trailing: new Icon(Icons.announcement),
            ),
            new Divider(),
            new ListTile(
                title: new Text("Logout"),
                trailing: new Icon(Icons.arrow_forward),
                onTap: () {}),
            new Divider(),
            new ListTile(
              title: new Text("Terms & Conditions"),
              trailing: new Icon(Icons.bubble_chart),
            ),
            new ListTile(
              title: new Text("Contact Us"),
              trailing: new Icon(Icons.help),
              onTap: () {
                _showDialog();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 150,
                child: RaisedButton(
                  splashColor: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {},
                  color: Colors.deepPurple.shade400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Let's Chat",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 150,
                child: RaisedButton(
                  splashColor: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                  onPressed: () {
                    _showDialog();
                  },
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.deepPurple.shade400,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Contact Us",
                        style: TextStyle(
                          color: Colors.deepPurple.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: <Widget>[
                Text(
                  "Building a Healthy Community One Individual at a Time",
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: RaisedButton(
                            elevation: 3.0,
                            color: Colors.deepPurple.shade200,
                            onPressed: () {},
                            shape: CircleBorder(),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Text(
                                    "Status",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: RaisedButton(
                            color: Colors.deepPurple.shade200,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Upload()));
                            },
                            shape: CircleBorder(),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Text(
                                    "Post",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: RaisedButton(
                            color: Colors.deepPurple.shade200,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Media()));
                            },
                            shape: CircleBorder(),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Text(
                                    "Media",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: RaisedButton(
                            color: Colors.deepPurple.shade200,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Events()));
                            },
                            shape: CircleBorder(),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Text(
                                    "Events",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Container(
                    height: 60,
                    child: RaisedButton(
                      elevation: 0.0,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Registeration(),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      color: Colors.deepPurple.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Emotion Detector',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.purple.shade100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 30,
                      ),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "FAQ",
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 150,
                            child: RaisedButton(
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onPressed: () {},
                              color: Colors.purple.shade100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "What causes depression?",
                                    style: TextStyle(
                                      color: Colors.purple.shade400,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.purple.shade400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 100,
                            width: 150,
                            child: RaisedButton(
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onPressed: () {},
                              color: Colors.deepOrange.shade100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "How can I tell if someone has a mental health problem?",
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.deepOrange,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 150,
                            child: RaisedButton(
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onPressed: () {},
                              color: Colors.deepOrange.shade100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "What is the best way to improve my mental wellbeing?",
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.deepOrange,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 100,
                            width: 150,
                            child: RaisedButton(
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onPressed: () {},
                              color: Colors.purple.shade100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "What personal info.\ndoes this app collect?",
                                    style: TextStyle(
                                      color: Colors.purple.shade400,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.purple.shade400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
