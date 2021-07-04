import 'package:flutter/material.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/card_main.dart';
import 'package:vaccine8/components/widgets/card_section.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/models/Patient.dart';

class Body extends StatefulWidget {
  // Patient patient;
  Body(
      // {@required this.patient}
      );
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _symptom() async {
    final result = await Navigator.pushNamed(context, jdjkSymptoms);

    // if (result != null) {
    //   setState(() => widget.patient = result);
    // }
  }

  void _appointment() async {
    final result = await Navigator.pushNamed(
      context,
      jdjkAppointment,
    );

    // if (result != null) {
    //   setState(() => widget.patient = result);
    // }
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: MyCustomClipper(clipType: ClipType.bottom),
          child: Container(
            color: Color.fromRGBO(42, 42, 192, .7),
            height: 228.5 + statusBarHeight,
          ),
        ),
        Positioned(
          right: -45,
          top: -30,
          child: ClipOval(
            child: Container(
              color: Colors.black.withOpacity(0.05),
              height: 220,
              width: 220,
            ),
          ),
        ),

        // BODY
        Padding(
          padding: EdgeInsets.only(right: 30.0, bottom: 30, top: 30),
          child: ListView(
            children: <Widget>[
              // Header - Greetings and Avatar
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: InkWell(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Icon(
                        FontAwesomeIcons.stream,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Welcome Omar",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  CircleAvatar(
                      radius: 26.0,
                      backgroundImage: AssetImage('assets/profile_picture.png'))
                ],
              ),

              // SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          // CardMain(
                          //   icon: Icon(
                          //     FontAwesomeIcons.heartbeat,
                          //     color: Colors.blue[700],
                          //     size: 35,
                          //   ),
                          //   title: "Heart beat",
                          //   value: "66",
                          //   unit: "bpm",
                          //   color: Colors.white,
                          // ),
                          // CardMain(
                          //     icon: Icon(
                          //       FontAwesomeIcons.burn,
                          //       color: Colors.red[900],
                          //       size: 35,
                          //     ),
                          //     title: "Blood Pressure",
                          //     value: "66/123",
                          //     unit: "mmHg",
                          //     color: Colors.white)
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _appointment(),
                          child: CardSection(
                            icon: Icon(
                              Icons.assignment,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: "Appointmetns",
                            color: Colors.cyan[800],
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => _symptom(),
                          child: CardSection(
                            icon: Icon(
                              Icons.medical_services_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                            title: "Monitoring",
                            color: Colors.purple[900],
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          // onTap: () => _pcrNavigate(),
                          child: CardSection(
                            icon: Icon(
                              Icons.settings_applications_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                            title: "Account Settings",
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
