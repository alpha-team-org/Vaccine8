import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/appointment_card.dart';
import 'package:vaccine8/components/widgets/card_items.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/pcr/pcr_board/pcr_dash_viewnodel.dart';

class Body extends StatefulWidget {
  final PcrDashboardViewmodel viewmodel;
  Body({@required this.viewmodel});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    void _navigate() async {
      await Navigator.pushNamed(
        context,
        centersRoute,
      );
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
                height: widget.viewmodel.appointment != null ? 240 : 220,
                children: [
                  (widget.viewmodel.appointment == null)
                      ? ButtonCard(
                          onTap: () => _navigate(),
                          title: "Book and View COVID-19 Test\n Appointments",
                        )
                      : Column(
                          children: [
                            AppointmentCard(
                                center:
                                    widget.viewmodel.appointment[0].centerId,
                                day: DateFormat('EEEE').format(
                                  widget.viewmodel.appointment[0].day,
                                ),
                                date: DateFormat('yyyy-MM-dd').format(
                                    widget.viewmodel.appointment[0].day),
                                time: DateFormat('kk:mm').format(
                                    widget.viewmodel.appointment[0].day),
                                isDone: true,
                                icon: (!(widget.viewmodel.appointment[0].day
                                                .isAfter(DateTime.now()) &&
                                            widget.viewmodel.appointment[0]
                                                    .type ==
                                                "pcr") ||
                                        widget.viewmodel.appointment[0].approve)
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : widget.viewmodel.appointment[0].disapprove
                                        ? Icon(Icons.calendar_today)
                                        : Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.red,
                                          ),
                                onTap: () => _navigate(),
                                appointment: widget.viewmodel.appointment[0]),
                          ],
                        ),
                  SizedBox(height: 40),
                ],
                title: widget.viewmodel.userName,
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
// Widget _buildPopupDialog(BuildContext context,PcrDashboardViewmodel viewmodel) {
//   return Dialog(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//     elevation: 16,
//     child: Container(
//         height: 400.0,
//         width: 360.0,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               decoration: InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'what  is your symptoms'),
//                   onChanged: (value) =>viewmodel.appointment[0].symptoms = value ,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top:8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(onPressed: () => {
//                     viewmodel.updateApp(),
//                     Navigator.pop(context,null)
//                   }, child: Text("Save")),
//                   ElevatedButton(
//                       onPressed: () => {},
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all<Color>(Colors.red)),
//                       child: Text("Cancel"))
//                 ],
//               ),
//             ),
//           ],
//         )),
//   );
// }
