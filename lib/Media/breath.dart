import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class Breathe extends StatefulWidget {
  @override
  _BreatheState createState() => _BreatheState();
}

class _BreatheState extends State<Breathe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'assets/logos/meditate.jpg',
                  fit: BoxFit.cover,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF422479).withOpacity(0.95),
                        Color(0xFF1C0746).withOpacity(0.75),
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                    ),
                  ),
                ),
                Center(
                  child: AvatarGlow(
                    duration: Duration(milliseconds: 2000),
                    endRadius: 120,
                    shape: BoxShape.circle,
                    repeatPauseDuration: Duration(milliseconds: 100),
                    repeat: true,
                    glowColor: Colors.red,
                    showTwoGlows: true,
                    startDelay: Duration(milliseconds: 1),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red.shade400,
                        size: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
