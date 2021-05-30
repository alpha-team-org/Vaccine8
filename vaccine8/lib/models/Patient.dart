import 'package:vaccine8/models/Appointment.dart';

class Patient {
  String name;
  String imageRoute;
  String address;
  DateTime pcrAppointment;
  bool hasPcrAppointment;

  Patient(
      {this.name,
      this.imageRoute,
      this.address,
      this.hasPcrAppointment = false});

  get appointment => pcrAppointment;
  set appointment(value) => pcrAppointment = value;
}
