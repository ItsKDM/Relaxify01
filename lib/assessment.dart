import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  String feel = "0";
  double _value = 0.0;
  double lastsection = 0.0;
  String feedbacktxt = "Depressed";
  Color backgroundclr = Color(0xFFFCBDE9);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundclr,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.black87,
          ),
        ),
        backgroundColor: backgroundclr,
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "How Are You\nFeeling Today?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        feedbacktxt,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: FlareActor(
                'assets/flares/feelings.flr',
                fit: BoxFit.contain,
                alignment: Alignment.center,
                animation: feel,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Slider(
                    min: 0.0,
                    max: 100.0,
                    value: _value,
                    divisions: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.black54,
                    onChanged: (val) {
                      setState(() {
                        _value = val;
                      });
                      if (_value == 0.0) {
                        if (lastsection > 0.0) {
                          setState(() {
                            feel = "0-";
                          });
                        }
                        setState(() {
                          lastsection = 0.0;
                          backgroundclr = Color(0xFFFCBDE9);
                          feedbacktxt = "Depressed";
                        });
                      } else if (_value > 0.0 && _value < 25.0) {
                        if (lastsection == 0.0) {
                          setState(() {
                            feel = "0+";
                          });
                        } else if (lastsection == 50.0) {
                          setState(() {
                            feel = "25-";
                          });
                        }
                        setState(() {
                          lastsection = 25.0;
                          backgroundclr = Colors.teal.shade100;
                          feedbacktxt = "Irritated";
                        });
                      } else if (_value >= 25.0 && _value < 50.0) {
                        if (lastsection == 25.0) {
                          setState(() {
                            feel = "25+";
                          });
                        } else if (lastsection == 75.0) {
                          setState(() {
                            feel = "50-";
                          });
                        }
                        setState(() {
                          lastsection = 50.0;
                          backgroundclr = Colors.orangeAccent;
                          feedbacktxt = "Confused";
                        });
                      } else if (_value >= 50.0 && _value < 75.0) {
                        if (lastsection == 50.0) {
                          setState(() {
                            feel = "50+";
                          });
                        } else if (lastsection == 100.0) {
                          setState(() {
                            feel = "75-";
                          });
                        }
                        setState(() {
                          lastsection = 75.0;
                          backgroundclr = Colors.orange.shade200;
                          feedbacktxt = "Happy";
                        });
                      } else if (_value >= 75.0 && _value <= 100.0) {
                        if (lastsection == 75.0) {
                          setState(() {
                            feel = "75+";
                          });
                        }
                        setState(
                          () {
                            lastsection = 100.0;
                            backgroundclr = Colors.amber.shade100;
                            feedbacktxt = "Cheerful";
                          },
                        );
                      }
                    },
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 60.0,
                    child: TextFormField(
                      maxLength: 20,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500),
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 17.0),
                        prefixIcon: Icon(
                          Icons.insert_comment,
                          color: Colors.black,
                        ),
                        hintText: 'Add a comment',
                        hintStyle: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
