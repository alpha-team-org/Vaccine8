import 'package:vaccine8/models/Appointment.dart';

class Centers{
String name ;
String address;
List<Appointment> appointments;
String imgRout;
Centers(this.name , this.address , this.appointments,this.imgRout);

Centers.copy(Centers from) :this(
  from.name , from.address , [...from.appointments.map((e) => Appointment.copy(e))]
,from.imgRout
);
}