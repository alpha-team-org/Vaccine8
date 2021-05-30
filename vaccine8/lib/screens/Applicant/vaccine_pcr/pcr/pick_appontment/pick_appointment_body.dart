import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/appointment_card.dart';
import 'package:vaccine8/components/widgets/card_main.dart';
import 'package:vaccine8/components/widgets/card_section.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:intl/intl.dart';
import 'package:vaccine8/models/Patient.dart';
import 'package:vaccine8/models/mock_data.dart';

class Body extends StatefulWidget {
  Centers centers;
  Body(this.centers);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Appointment selectedAppointment;
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
                                    widget
                                        .centers.appointments[index].date[index]
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        // AppointemntsSection(
                        //   appointmentDate: DateFormat('EEEE')
                        //       .format(widget.centers.appointments[index].day),
                        //   appointmentDay: DateFormat('dd-MM-yyyy').format(
                        //       widget.centers.appointments[index].date[index]),
                        //   onPressed: () {},
                        // );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ],
              ),
              AppointmentDays(selectedAppointment, patientList[0])
            ],
          ),
        ),
      ],
    );
  }
}

class AppointmentDays extends StatefulWidget {
  final Appointment appointment;
  final Patient patient;
  AppointmentDays(this.appointment, this.patient);

  @override
  _AppointmentDaysState createState() => _AppointmentDaysState();
}

class _AppointmentDaysState extends State<AppointmentDays> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 190,
      child: widget.appointment != null
          ? ListView.separated(
              itemCount: widget.appointment.date.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => setState(() {
                    widget.patient.pcrAppointment = DateTime.utc(
                        widget.appointment.day.year,
                        widget.appointment.day.month,
                        widget.appointment.day.day,
                        widget.appointment.date[index].hour,
                        widget.appointment.date[index].minute);

                    widget.patient.hasPcrAppointment =
                        !widget.patient.hasPcrAppointment;
                  }),
                  child: AppointmentCard(
                    onTap: () => setState(
                      () {
                        widget.patient.pcrAppointment = DateTime.utc(
                            widget.appointment.day.year,
                            widget.appointment.day.month,
                            widget.appointment.day.day,
                            widget.appointment.date[index].hour,
                            widget.appointment.date[index].minute);

                        widget.patient.hasPcrAppointment =
                            !widget.patient.hasPcrAppointment;
                      },
                    ),
                    title:
                        '${widget.appointment.date[index].hour}:${widget.appointment.date[index].minute}',
                    value: '',
                    isDone: widget.patient.hasPcrAppointment == true &&
                            widget.patient.pcrAppointment.hour ==
                                widget.appointment.date[index].hour &&
                            widget.patient.pcrAppointment.minute ==
                                widget.appointment.date[index].minute
                        ? true
                        : false,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.white.withOpacity(.8)),
            )
          : Container(),
    );
  }
}

class AppointemntsSection extends StatefulWidget {
  final String appointmentDay;
  final String appointmentDate;
  final Function onPressed;
  AppointemntsSection(
      {this.appointmentDate, this.appointmentDay, this.onPressed});
  @override
  _AppointemntsSectionState createState() => _AppointemntsSectionState();
}

class _AppointemntsSectionState extends State<AppointemntsSection> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xFFF5F5F7);
    return Material(
      color: Color(0xFFF5F5F7),
      child: Container(
        margin: const EdgeInsets.only(
          right: 10.0,
          left: 0.0,
          top: 5.0,
          bottom: 5.0,
        ),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
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
          onPressed: () => backgroundColor = Colors.blue[100],
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  widget.appointmentDay ?? "error",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.appointmentDate ?? "error",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Material appointmentDays(String appointmentDay, String appointmentDate,
    Function onPressed, context) {
  Color backgroundColor = Color(0xFFF5F5F7);
  return Material(
    color: Color(0xFFF5F5F7),
    child: Container(
      margin: const EdgeInsets.only(
        right: 10.0,
        left: 0.0,
        top: 5.0,
        bottom: 5.0,
      ),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
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
        onPressed: () => backgroundColor = Colors.blue[100],
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                appointmentDay ?? "error",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                appointmentDate ?? "error",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Material appointmentTimes(String appointmentDay, context) {
  return Material(
    color: Colors.white,
    child: Container(
      margin: const EdgeInsets.only(
        right: 1.0,
        left: 20.0,
        top: 5.0,
        bottom: 5.0,
      ),
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.only(
              left: 20,
              right: 20,
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
        onPressed: () {},
        child: Align(
          alignment: Alignment.center,
          child: Text(
            appointmentDay ?? "error",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

// return Container(
//   width: double.infinity,
//   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//   decoration: BoxDecoration(color: bacColor),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       _rowfForImageNName(centers),
//       buildCarouselSlider(),
//       _Button()
//     ],
//   ),
// );

//   CarouselSlider buildCarouselSlider() {
//     return CarouselSlider(
//       options: CarouselOptions(height: 155.0),
//       items: centers.appointments.map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: EdgeInsets.symmetric(horizontal: 5.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(.5),
//                       offset: const Offset(
//                         1.0,
//                         1.0,
//                       ),
//                       blurRadius: 1.0,
//                       spreadRadius: 1.0,
//                     )
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Column(
//                     children: [
//                       Row(children: [
//                         Column(children: [
//                           Text(DateFormat('yyyy-MM-dd').format(i.date),
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 22)),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 13.0),
//                             child: Text("3 slots available",
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.grey)),
//                           )
//                         ])
//                       ]),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8.0, vertical: 5),
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: Container(
//                                 padding: const EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all()),
//                                 child: Text(
//                                   "10",
//                                   style: TextStyle(fontSize: 20.0),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: Container(
//                                 padding: const EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all()),
//                                 child: Text(
//                                   "12",
//                                   style: TextStyle(fontSize: 20.0),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: Container(
//                                 padding: const EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all()),
//                                 child: Text(
//                                   "2".toString(),
//                                   style: TextStyle(fontSize: 20.0),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ));
//           },
//         );
//       }).toList(),
//     );
//   }
// }

// class _Button extends StatelessWidget {
//   const _Button({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 19),
//       width: double.infinity,
//       height: 70,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//       margin: EdgeInsets.symmetric(horizontal: 15),
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.pushNamed(context, successfullRoute);
//         },
//         child: Text(
//           "Save",
//           style: TextStyle(fontSize: 28),
//         ),
//         style: ElevatedButton.styleFrom(
//           primary: iconColor, // background
//           onPrimary: Colors.white, // foreground
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _rowfForImageNName extends StatelessWidget {
//   Centers centers;
//   _rowfForImageNName(this.centers);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Image.asset(
//           centers.imgRout,
//           width: 200,
//           height: 250,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 15.0),
//           child: Text(
//             "${centers.name} ",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }
// }
