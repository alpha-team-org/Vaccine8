import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vaccine8/components/constants/const.dart';
import 'package:vaccine8/components/widgets/custom_clipper.dart';
import 'package:vaccine8/models/Appointment.dart';

import '../symptoms_viewmodel.dart';

class Body extends StatelessWidget {
  
  SymptomsViewmodel viewmodel;
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
                      "Montoring",
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
              Text("Applicant Symptoms",
                  style: TextStyle(color: Colors.blue[800], fontSize: 25)),
              Divider(
                color: Colors.blue[900],
                thickness: 2,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 115.0),
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
                      itemBuilder: (context, index)=>
                        
                        
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: Card(
                            elevation: 4,
                            shadowColor: Colors.black,
                            
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                        (viewmodel.appointments[index].getSymptoms!=null)?
                             Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            viewmodel.user[index+1].photoUrl),
                                      ),
                                    ),
                                    Text(viewmodel.user[index+1].name)
                                  ],
                                ),
                                
                                ListTile(
                                  // leading: Icon(Icons.assignment),
                                  title: Text(viewmodel.appointments[index].symptoms),
                                  subtitle: Text(DateFormat('yyyy-MM-dd')
                                      .format(viewmodel.appointments[index].day)),

                                  onTap: () async {
                                    viewmodel.index = index;
                                    await Navigator.pushNamed(
                                        context, medicine);
                                  },
                                ),
                                new TextButton(
                                  child: Text('reply'),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildPopupDialog(context,viewmodel,viewmodel.appointments[index]),
                                    );
                                  },
                                )
                              ],
                            ):
                            
                        Container(),
                          ),
                        )
                      
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildPopupDialog(BuildContext context,SymptomsViewmodel viewmodel,Appointment appointment) {
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
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                onChanged: ( value) => {
                  appointment.reply =value
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => {
                  viewmodel.updateSymptoms(appointment)
                }, child: Text("reply")),
                ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    child: Text("cancle"))
              ],
            ),
          ],
        )),
  );
}
