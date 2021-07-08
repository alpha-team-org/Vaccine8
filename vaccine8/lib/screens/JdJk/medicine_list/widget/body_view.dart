import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';

import '../medicine_viewmodel.dart';

class Body extends StatefulWidget {
  MedicineViewmodel viemodel ;
  Body(this.viemodel);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Stack(children: [
      ClipPath(
        clipper: MyCustomClipper(clipType: ClipType.bottom),
        child: Container(
          color: Color.fromRGBO(42, 42, 192, .7),
          height: 100.5 + statusBarHeight,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 30.0, bottom: 30, top: 30),
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
                    "Medicine List",
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
        padding: const EdgeInsets.only(top: 135, left: 10, right: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" Medicine List",
                style: TextStyle(color: Colors.purple[800], fontSize: 25)),
            Divider(
              color: Colors.blue[900],
              thickness: 2,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 135.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.viemodel.medicins.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Card(
                          elevation: 4,
                            shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.medical_services_outlined ,color: Colors.purple[800])  ,
                                title: Text(widget.viemodel.medicins[index].name,style: TextStyle(color: Colors.purple[900]),),
                                // subtitle: Text('14-9-2021'),
                                onTap: () {
                                 
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

