import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Centers.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  Centers centers;
  Body(this.centers);
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
                    padding: const EdgeInsets.only(left: 20, right: 80),
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
                      "Centers List",
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
        Container(
          padding: EdgeInsets.only(top: 300),
          child: AppointemntsSection(centers),
        ),
      ],
    );
  }
}

class AppointemntsSection extends StatefulWidget {
  final Centers centers;
  AppointemntsSection(this.centers);
  @override
  _AppointemntsSectionState createState() => _AppointemntsSectionState();
}

class _AppointemntsSectionState extends State<AppointemntsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SectionTitle(title: "Appointments"),
        Container(
          margin: const EdgeInsets.only(
            bottom: 15.0,
          ),
          height: 60,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              appointmentDays(
                  DateFormat('EEEE')
                      .format(widget.centers.appointments[0].date),
                  DateFormat('dd-MM-yyyy')
                      .format(widget.centers.appointments[0].date),
                  context),
              appointmentDays("Tuesday", "June 19th", context),
              appointmentDays("Wednesday", "July 24th", context),
              appointmentDays("Thursday", "July 12th", context),
              appointmentDays("Friday", "July 13th", context),
              appointmentDays("Saturday", "August 7th", context),
              appointmentDays("Sunday", "August 9th", context),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 15.0,
          ),
          height: 50,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              appointmentTimes(
                  DateFormat("hh:mm")
                      .format(widget.centers.appointments[0].date),
                  context),
              appointmentTimes("9:30 AM", context),
              appointmentTimes("10:00 AM", context),
              appointmentTimes("10:30 AM", context),
              appointmentTimes("11:00 AM", context),
            ],
          ),
        ),
      ],
    );
  }
}

Material appointmentDays(
    String appointmentDay, String appointmentDate, context) {
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
        onPressed: () {},
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
