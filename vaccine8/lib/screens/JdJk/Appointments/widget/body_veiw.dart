import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Appointment.dart';
import 'package:vaccine8/models/Patient.dart';

import '../appointment_vewimodel.dart';

class Body extends StatelessWidget {
  DrAppointmentViewmodel viewmodel;
  Body(this.viewmodel);
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Stack(
      children: [
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
                      "Appointments",
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
              Text(" Appointments List",
                  style: TextStyle(color:Color.fromRGBO(42, 42, 192, .7), fontSize: 25)),
              Divider(
                color: Color.fromRGBO(42, 42, 192, .7),
                thickness: 2,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 135.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 55.0, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewmodel.appointments.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                 ListTile(
                                        leading: Icon(Icons.assignment,
                                            color: Color.fromRGBO(42, 42, 192, .7)),
                                        title: Text(
                                            "${viewmodel.user[index + 1].name}-${viewmodel.appointments[index].type}",
                                            style: TextStyle(
                                                color: Color.fromRGBO(42, 42, 192, .7) ,fontWeight: FontWeight.w500 , fontSize: 18)),
                                        subtitle: Text(DateFormat('yyyy-MM-dd')
                                            .format(viewmodel
                                                .appointments[index].day)),
                                        onTap:
                                        (!viewmodel.appointments[index].approve &&
                                        viewmodel
                                            .appointments[index].disapprove)?
                                    
                                         () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return _buildPopupDialog(
                                                  context,
                                                  viewmodel.appointments[index],
                                                  viewmodel,
                                                  // viewmodel.user[index + 1],
                                                  );
                                            },
                                          );
                                        }:null,
                                        trailing: (viewmodel.appointments[index].approve ==true)?
                                        Text("Approved",style:TextStyle(color: Colors.green ,
                                        fontSize: 22 , fontWeight: FontWeight.bold ) ,):
                                        (viewmodel.appointments[index].disapprove ==false)?
                                        Text("Disapproved",style:TextStyle(color: Colors.red ,
                                        fontSize: 22 , fontWeight: FontWeight.bold )) :null,
                                      )
                                   
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
      ],
    );
  }
}

Widget _buildPopupDialog(BuildContext context, Appointment app,
    DrAppointmentViewmodel viewmodel) {
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
            
            Text('Date :${app.day.year}-${app.day.month}-${app.day.day} ',
                style:
                    TextStyle(color: Colors.blue.withOpacity(1), fontSize: 20)),
            Text('Time : ${app.day.hour}:${app.day.minute}${app.day.second}',
                style:
                    TextStyle(color: Colors.blue.withOpacity(1), fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () =>
                        {app.approve = true, viewmodel.updateAppointment(app)
                        ,Navigator.popAndPushNamed(context, jdjkAppointment)},
                    child: Text("approve")),
                ElevatedButton(
                    onPressed: () => {
                          app.disapprove = false,
                          viewmodel.updateAppointment(app)
                          ,Navigator.popAndPushNamed(context, jdjkAppointment)
                        },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    child: Text("Disapprove"))
              ],
            ),
          ],
        )),
  );
}
