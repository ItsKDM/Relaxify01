import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
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
          "Events",
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
                  "Tough times never last, but tough people do!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
