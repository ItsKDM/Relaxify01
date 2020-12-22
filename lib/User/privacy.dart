import 'package:flutter/material.dart';
import 'package:relaxify/home.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  Widget _buildPrivateBtn() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25.0),
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.deepOrange.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'PRIVATE MODE',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Keep your profile and post private',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        },
      ),
    );
  }

  Widget _buildCommunityBtn() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25.0),
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.deepOrange.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'COMMUNITY MODE',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Get feedback from other users',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange.shade200,
        title: Text(
          "Privacy",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
            child: Column(
              children: <Widget>[
                Text(
                  "Privacy Setting",
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepOrange.shade200,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Please choose how you would like to experience Relaxify.",
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 50),
                _buildPrivateBtn(),
                _buildCommunityBtn()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
