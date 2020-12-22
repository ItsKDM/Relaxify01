import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF61A4F1),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(170),

                  // ignore: deprecated_member_use
                  child: Image.network(_firebaseAuth.currentUser.photoURL),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "${_firebaseAuth.currentUser.displayName}",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
