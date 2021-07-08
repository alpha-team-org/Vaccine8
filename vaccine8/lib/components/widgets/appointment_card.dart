import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Appointment.dart';

class AppointmentCard extends StatelessWidget {
  final String center;
  final String day;
  final String date;
  final String time;
  final Icon icon;
  final bool isDone;
  final Function onTap;
  Appointment appointment;

  AppointmentCard(
      {Key key,
      @required this.center,
      @required this.day,
      @required this.date,
      @required this.time,
      @required this.icon,
      @required this.onTap,
      this.isDone,
      this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: ClipPath(
                clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                child: Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xFF3EC6FF).withOpacity(0.1),
                  ),
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 10),
                      icon,
                      SizedBox(width: 2),
                      Text(
                        day,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF486581)),
                      ),
                      SizedBox(width: 20),
                      Text(
                        center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF486581)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(height: 40),
                            Padding(
                                padding: EdgeInsets.only(top: 10, left: 40)),
                            Text(
                              '$date',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF486581)),
                            ),
                            SizedBox(width: 30),
                            Text(
                              '$time',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF486581)),
                            ),
                            SizedBox(width: 30),
                           ((appointment.day.isAfter(DateTime.now()))&& appointment.approve && !appointment.disapprove )?

                            ElevatedButton(
                              onPressed: onTap,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(42, 42, 192, .7)),
                              ),
                              child: Text(
                                'Edit',
                                style: TextStyle(fontSize: 16),
                              ),
                            ):
                            Container()
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
