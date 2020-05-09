import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmotionsPage(),
    );
  }
}

class EmotionsPage extends StatefulWidget {
  @override
  _EmotionsPageState createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {
  String feel = "0";
  double _value = 0.0;
  double lastsection = 0.0;
  String feedbacktxt = "Very Poor";
  Color backgroundclr = Colors.red;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundclr,
        body: Stack(
          children: <Widget>[
            Center(
              child: FlareActor(
                'assets/flares/feelings.flr',
                fit: BoxFit.contain,
                alignment: Alignment.center,
                animation: feel,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Text(
                    feedbacktxt,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Slider(
                  min: 0.0,
                  max: 100.0,
                  value: _value,
                  divisions: 100,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.black,
                  label: 'Set a value',
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
                        backgroundclr = Colors.red;
                        feedbacktxt = "Very Poor";
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
                        backgroundclr = Colors.orange;
                        feedbacktxt = "Poor";
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
                        feedbacktxt = "Below Average";
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
                        backgroundclr = Colors.yellow;
                        feedbacktxt = "Above Average";
                      });
                    } else if (_value >= 75.0 && _value <= 100.0) {
                      if (lastsection == 75.0) {
                        setState(() {
                          feel = "75+";
                        });
                      }
                      setState(() {
                        lastsection = 100.0;
                        backgroundclr = Colors.green;
                        feedbacktxt = "Excellent";
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
