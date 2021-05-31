import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/appointment_days.dart';
import 'package:vaccine8/components/widgets/day_card.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:intl/intl.dart';
import 'package:vaccine8/models/Patient.dart';

class Body extends StatefulWidget {
  Centers centers;
  Patient patient;
  Body(this.centers, this.patient);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Appointment selectedAppointment;
  void _navigate() async {
    final result = await Navigator.pushNamed(context, dashboardRoute,
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
                    padding: const EdgeInsets.only(left: 20, right: 70),
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
                      "Appointments List",
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
        Padding(
          padding: EdgeInsets.only(top: 300, left: 10),
          child: Column(
            children: [
              Column(
                children: [
                  // SectionTitle(title: "Appointments"),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 15.0,
                    ),
                    height: 60,
                    child: ListView.separated(
                      itemCount: widget.centers.appointments.length,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            right: 10.0,
                            left: 0.0,
                            top: 5.0,
                            bottom: 5.0,
                          ),
                          decoration: new BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            shape: BoxShape.rectangle,
                            color: widget.centers.appointments[index].isSelected
                                ? Colors.blue[100]
                                : Color(0xFFF5F5F7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                  top: 6,
                                ),
                              ),
                              textStyle: MaterialStateProperty.all(
                                TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.5),
                                ),
                              ),
                            ),
                            onPressed: () => setState(() {
                              widget.centers.selectAppointment(index);
                              selectedAppointment =
                                  widget.centers.appointments[index];
                            }),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat('EEEE').format(
                                        widget.centers.appointments[index].day),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    DateFormat('yyyy-MM-dd').format(
                                        widget.centers.appointments[index].day),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ],
              ),
              AppointmentDays(selectedAppointment, widget.patient, false),
              ElevatedButton(
                onPressed: () => _navigate(),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 60)),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(42, 42, 192, .7)),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
