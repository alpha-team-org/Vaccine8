import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/card_items.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Patient.dart';

class Body extends StatefulWidget {
  Patient patient;
  Body({@required this.patient});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    void _navigate() async {
      final result = await Navigator.pushNamed(context, centersRoute,
          arguments: widget.patient);

      if (result != null) {
        setState(() => widget.patient = result);
      }
    }

    void _navigateEdit() async {
      final result = await Navigator.pushNamed(context, centersRoute,
          arguments: widget.patient);

      if (result != null) {
        setState(() => widget.patient = result);
      }
    }

    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: MyCustomClipper(clipType: ClipType.bottom),
          child: Container(
            color: Color.fromRGBO(42, 42, 192, .7),
            height: 100.5 + statusBarHeight,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 30.0, bottom: 30, top: 20),
          child: ListView(
            children: <Widget>[
              // Header - Greetings and Avatar
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 80),
                    child: InkWell(
                      onTap: () => Navigator.pop(context, widget.patient),
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "COVID-19 Test",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 300, left: 15),
              child: MainCard(
                onEditTap: () => _navigateEdit(),
                center: widget.patient.center != null
                    ? widget.patient.center
                    : 'error',
                day: widget.patient.hasPcrAppointment == true
                    ? DateFormat('EEEE').format(widget.patient.pcrAppointment)
                    : 'error',
                date: widget.patient.hasPcrAppointment == true
                    ? DateFormat('yyyy-MM-dd')
                        .format(widget.patient.pcrAppointment)
                    : 'error',
                time: widget.patient.hasPcrAppointment == true
                    ? DateFormat('kk:mm').format(widget.patient.pcrAppointment)
                    // ? widget.patient.pcrAppointment.hour < 12
                    // ? "${DateFormat('kk:mm').format(widget.patient.pcrAppointment)} AM"
                    // : "${DateFormat('kk:mm').format(widget.patient.pcrAppointment)} PM"
                    : 'error',
                hasAppointment: widget.patient.hasPcrAppointment,
                onTap: () => _navigate(),
                title: 'OMAR',
                icon: Icon(
                  FontAwesomeIcons.userAlt,
                  size: 28,
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
