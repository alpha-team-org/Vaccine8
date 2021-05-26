import 'package:vaccine8/models/Appointment.dart';

class Patient{
String name;
String imageRoute;
String address;
List<Appointment> _appointment;

Patient(this.name , this.imageRoute,this.address)
;
get appointment => _appointment;
set appointment(value) =>_appointment[_appointment.length+1] =value;

}