import 'package:flutter/material.dart';
import 'package:vaccine8/app/colors.dart';
import 'package:vaccine8/app/dependencies.dart';
import 'package:vaccine8/screens/JdJk/Appointments/appointment_vewimodel.dart';


import '../../view.dart';
import 'widget/body_veiw.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      //     AppBar(
      //       backgroundColor: Color.fromRGBO(42, 42, 192, .7),
      //       title: const Text("Pending Appointment"), actions: <Widget>[
      //   CircleAvatar(
      //     backgroundImage: AssetImage('assets/profile_picture.png'),
      //   ),
      // ]),
      backgroundColor: bacColor,
      body :ConsumerView<DrAppointmentViewmodel>
      (
        initViewmodel: (viewmodel)=>dependency<DrAppointmentViewmodel>().getAppointments(),
        builder:(context,viewmodel,___) {
          // final apps = viewmodel.appointments;
          // final users = viewmodel.user;
          return Body(viewmodel);
          }),
    );
  }
}
