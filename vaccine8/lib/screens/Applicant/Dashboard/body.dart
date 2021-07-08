import 'package:flutter/material.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/card_main.dart';
import 'package:vaccine8/components/widgets/card_section.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/models/user.dart';

class Body extends StatefulWidget {
  User patient;
  Body({this.patient});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _pcrNavigate() async {
    final result =
        await Navigator.pushNamed(context, pcrRoute, arguments: widget.patient);

    if (result != null) {
      setState(() => widget.patient = result);
    }
  }

  void _vaccineNavigate() async {
    final result = await Navigator.pushNamed(context, vaccineRoute,
        arguments: widget.patient);

    if (result != null) {
      setState(() => widget.patient = result);
    }
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
                      "Welcome ",
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

              SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          CardMain(
                            icon: Icon(
                              FontAwesomeIcons.heartbeat,
                              color: Colors.blue[700],
                              size: 35,
                            ),
                            title: "Heart beat",
                            value: "66",
                            unit: "bpm",
                            color: Colors.white,
                          ),
                          CardMain(
                              icon: Icon(
                                FontAwesomeIcons.burn,
                                color: Colors.red[900],
                                size: 35,
                              ),
                              title: "Blood Pressure",
                              value: "66/123",
                              unit: "mmHg",
                              color: Colors.white)
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _vaccineNavigate(),
                          child: CardSection(
                            icon: Icon(
                              FontAwesomeIcons.syringe,
                              color: Colors.white,
                              size: 30,
                            ),
                            title: "COVID-19 Vaccine",
                            color: Colors.cyan[800],
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => _pcrNavigate(),
                          child: CardSection(
                            icon: Icon(
                              Icons.coronavirus_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                            title: "COVID-19 Tests",
                            color: Colors.purple[900],
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
