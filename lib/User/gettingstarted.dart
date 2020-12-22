import 'package:flutter/material.dart';
import 'package:relaxify/home.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple.shade300,
        centerTitle: true,
        title: Text(
          "Getting Started",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 0.0),
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/logos/health.png'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 10.0),
                child: Text(
                  'DO YOU CATCH YOURSELF FEELING LONELY, SAD, DISAPPOINTED OR ANGRY FREQUENTLY DURING THE DAY?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                'WE GOT YOU COVERED',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25),
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'GET STARTED TODAY',
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.deepPurple.shade300,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
