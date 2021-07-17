import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';

class MainCard extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final Icon icon;
  final Color color;
  final double height;

  MainCard({
    @required this.children,
    @required this.title,
    @required this.icon,
    @required this.color,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: height,
        margin: const EdgeInsets.only(right: 15.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          shape: BoxShape.rectangle,
                          color: color,
                        ),
                        child: icon,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF486581)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(children: children),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: 90,
          margin: const EdgeInsets.only(right: 15.0),
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            shape: BoxShape.rectangle,
            color: Color.fromRGBO(42, 42, 192, .7),
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
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(top: 12)),
                              Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
