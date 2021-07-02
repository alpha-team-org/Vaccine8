import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/appointment_card.dart';
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
      final result = await Navigator.pushNamed(context, vaccineCentersRoute,
          arguments: widget.patient);

      if (result != null) {
        setState(() => widget.patient = result);
      }
    }

    void _navigateEdit() async {
      final result = await Navigator.pushNamed(context, vaccineCentersRoute,
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
                    padding: const EdgeInsets.only(left: 15, right: 80),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "COVID-19 Vaccine",
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
              padding: EdgeInsets.only(top: 200, left: 15),
              child: MainCard(
                height:
                //  widget.patient.hasVaccineAppointments ? 460 : 
                220,
                children: [
                  // !widget.patient.hasVaccineAppointments
                      // ? 
                      ButtonCard(
                          onTap: () => _navigate(),
                          title:
                              "Book and View COVID-19 Vaccine\n Appointments",
                        ),
                      // :
                      //  Column(
                      //     children: [
                      //       AppointmentCard(
                      //         center: widget.patient.vaccineCenter != null
                      //             ? widget.patient.vaccineCenter
                      //             : 'error',
                      //         day: widget.patient.hasVaccineAppointments == true
                      //             ? DateFormat('EEEE')
                      //                 .format(widget.patient.vaccineFirstDose)
                      //             : 'error',
                      //         date: widget.patient.hasVaccineAppointments ==
                      //                 true
                      //             ? DateFormat('yyyy-MM-dd')
                      //                 .format(widget.patient.vaccineFirstDose)
                      //             : 'error',
                      //         time: widget.patient.hasVaccineAppointments ==
                      //                 true
                      //             ? DateFormat('kk:mm')
                      //                 .format(widget.patient.vaccineFirstDose)
                      //             // ? widget.patient.pcrAppointment.hour < 12
                      //             // ? "${DateFormat('kk:mm').format(widget.patient.pcrAppointment)} AM"
                      //             // : "${DateFormat('kk:mm').format(widget.patient.pcrAppointment)} PM"
                      //             : 'error',
                      //         isDone: true,
                      //         icon: Icon(Icons.calendar_today),
                      //         onTap: () => _navigateEdit(),
                      //       ),
                      //     ],
                      //   ),
                  SizedBox(height: 40),
                  // widget.patient.hasVaccineAppointments
                  //     ? 
                      Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(
                                    MediaQuery.of(context).size.width, 90)),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(42, 42, 192, .7)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Register Symptoms',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(
                                    MediaQuery.of(context).size.width, 90)),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(42, 42, 192, .7)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                'View Medical Report',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ],
                        )
                      // : Container(),

                  // ButtonCard(
                  //   onTap: () {},
                  //   title: "View Medical Report",
                  // ),
                ],
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
