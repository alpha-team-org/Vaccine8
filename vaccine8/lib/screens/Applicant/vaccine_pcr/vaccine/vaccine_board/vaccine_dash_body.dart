import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/appointment_card.dart';
import 'package:vaccine8/components/widgets/card_items.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/screens/Applicant/vaccine_pcr/vaccine/vaccine_board/vaccine_dash_viewmodel.dart';

class Body extends StatefulWidget {
  final VaccineDashboardViewmodel viewmodel;
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
        vaccineCentersRoute,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 200, left: 15),
              child: MainCard(
                height: widget.viewmodel.appointment != null &&
                        (widget.viewmodel.appointment[0].day
                            .isBefore(DateTime.now()))
                    ? 460
                    : 250,
                children: [
                  (widget.viewmodel.appointment == null)
                      ? ButtonCard(
                          onTap: () => _navigate(),
                          title:
                              "Book and View COVID-19 Vaccine\n Appointments",
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                                "vaccine") ||
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
                  widget.viewmodel.checkAppointmentType()
                      ? (widget.viewmodel.appointment[0].day
                              .isBefore(DateTime.now()))
                          ? widget.viewmodel.appointment[0].symptoms == null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              _buildPopupDialog(
                                                  context, widget.viewmodel),
                                        );
                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                90)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(
                                                    42, 42, 192, .7)),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                                        minimumSize: MaterialStateProperty.all(
                                            Size(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                90)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(
                                                    42, 42, 192, .7)),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                              : Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 15.0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              child: ClipPath(
                                                clipper: MyCustomClipper(
                                                    clipType:
                                                        ClipType.semiCircle),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                    color: Colors.black
                                                        .withOpacity(0.03),
                                                  ),
                                                  height: 120,
                                                  width: 120,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Column(
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  // Icon and Hearbeat
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.comment_outlined,
                                                        color:
                                                            Color(0xFF486581),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Doctor reply',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Color(
                                                                  0xFF486581)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    widget
                                                                .viewmodel
                                                                .appointment[0]
                                                                .reply !=
                                                            null
                                                        ? widget
                                                            .viewmodel
                                                            .appointment[0]
                                                            .reply
                                                        : "The Doctor didn't reply yet",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Color(0xFF486581),
                                                    ),
                                                  ),
                                                  widget.viewmodel.medicins !=
                                                              null ||
                                                          widget
                                                                  .viewmodel
                                                                  .medicins
                                                                  .length !=
                                                              0
                                                      ? Column(
                                                          children: [
                                                            SizedBox(
                                                                height: 40),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .medical_services_outlined,
                                                                  color: Color(
                                                                      0xFF486581),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  'Medicines',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Color(
                                                                          0xFF486581)),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 15),
                                                            Text(
                                                              widget
                                                                  .viewmodel
                                                                  .medicins[0]
                                                                  .name,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                color: Color(
                                                                    0xFF486581),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {},
                                      ),
                                      color: Colors.transparent,
                                    ),
                                  ),
                                )
                          : Container()
                      : Container(),

                  // ButtonCard(
                  //   onTap: () {},
                  //   title: "View Medical Report",
                  // ),
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

Widget _buildPopupDialog(
    BuildContext context, VaccineDashboardViewmodel viewmodel) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    elevation: 16,
    child: Container(
        height: 400.0,
        width: 360.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'what  is your symptoms'),
              onChanged: (value) => viewmodel.appointment[0].symptoms = value,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () =>
                          {viewmodel.updateApp(), Navigator.pop(context, null)},
                      child: Text("Save")),
                  ElevatedButton(
                      onPressed: () => {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      child: Text("Cancel"))
                ],
              ),
            ),
          ],
        )),
  );
}
