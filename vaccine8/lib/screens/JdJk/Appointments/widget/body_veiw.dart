import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Appointment.dart';

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
            padding: const EdgeInsets.only(top:135,left:10,right:10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(" Appointments List",
                            style: TextStyle(color: Colors.purple[900], fontSize: 25)),
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
                              (!viewmodel.appointments[index].approve && viewmodel.appointments[index].disapprove)?
                                
                                   ListTile(
                                  leading: Icon(Icons.assignment,color: Colors.purple[900]),
                                  title: Text(
                                   "${viewmodel.user[index+1].name}-${viewmodel.appointments[index].type}"
                                     
                                    
                                  
                                  ,style: TextStyle(color: Colors.purple[900])),
                                  subtitle: Text(DateFormat('yyyy-MM-dd')
                                      .format(viewmodel.appointments[index].day)),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
  
                                         return  _buildPopupDialog(context,viewmodel.appointments[index], viewmodel);
                                          
                                          
                                          },
                                    );
                                  },
                                ) :Container()
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

Widget _buildPopupDialog(BuildContext context,Appointment app,DrAppointmentViewmodel viewmodel) {
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
            Text('Date : ',
                style:
                    TextStyle(color: Colors.blue.withOpacity(1), fontSize: 20)),
            Text('Time : ',
                style:
                    TextStyle(color: Colors.blue.withOpacity(1), fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => {
                  app.approve=true,
                  viewmodel.updateAppointment(app)

                }, child: Text("approve")),
                ElevatedButton(
                    onPressed: () => {
                      app.disapprove=false,
                  viewmodel.updateAppointment(app)
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
