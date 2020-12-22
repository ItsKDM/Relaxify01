import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relaxify/Media/breath.dart';

class Media extends StatefulWidget {
  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
          onPressed: () {},
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: <Widget>[
                Text(
                  "Sometimes the people around you won’t understand your journey.They don’t need to, it’s not for them.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    child: Center(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 120,
                              width: 150,
                              child: RaisedButton(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Breathe()));
                                },
                                color: Colors.purple.shade100,
                                child: Center(
                                    child: Text(
                                  "Peace",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.purple.shade600,
                                  ),
                                )),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 120,
                              width: 150,
                              child: RaisedButton(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {},
                                color: Colors.deepOrange.shade100,
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Center(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 120,
                              width: 150,
                              child: RaisedButton(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {},
                                color: Colors.deepOrange.shade100,
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 120,
                              width: 150,
                              child: RaisedButton(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {},
                                color: Colors.purple.shade100,
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20,
                                    color: Colors.purple.shade400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Advice From Doctors",
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
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 120,
                              width: 150,
                              child: RaisedButton(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {},
                                color: Colors.purple.shade100,
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20,
                                    color: Colors.purple.shade400,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 120,
                              width: 150,
                              child: RaisedButton(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {},
                                color: Colors.deepOrange.shade100,
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Center(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 120,
                              width: 150,
                              child: RaisedButton(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {},
                                color: Colors.deepOrange.shade100,
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 120,
                              width: 150,
                              child: RaisedButton(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () {},
                                color: Colors.purple.shade100,
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20,
                                    color: Colors.purple.shade400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
