import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';

class AppointmentCard extends StatefulWidget {
  final String title;
  final String value;
  final Function onTap;
  final bool isDone;

  AppointmentCard(
      {Key key,
      @required this.title,
      @required this.value,
      this.isDone,
      @required this.onTap})
      : super(key: key);

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        width: 120,
        height: 50,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF486581),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            shape: BoxShape.rectangle,
                            color: widget.isDone
                                ? Theme.of(context).accentColor
                                : Color(0xFFF0F4F8),
                          ),
                          width: 30,
                          height: 30,
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: widget.isDone
                                  ? Colors.white
                                  : Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        onTap: widget.onTap,
                      )
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
