import 'package:vaccine8/models/appointment.dart';

class Centers {
  dynamic id;
  String name;
  String address;
  List<Appointment> appointments;
  String imgRout;
  Centers(
      {this.id,
      this.name = "",
      this.address = "",
      this.appointments = null,
      this.imgRout = ""});

  // Centers.copy(Centers from)
  //     : this(
  //           id: from.id,
  //           name: from.name,
  //           address: from.address,
  //           appointments: [
  //             ...from.appointments.map((e) => Appointment.copy(e))
  //           ],
  //           imgRout: from.imgRout);

  void selectAppointment(int index) {
    // for (var i = 0; i < appointments.length; i++) {
    //   appointments[i].isSelected = false;
    // }
    // appointments[index].toggleStatus();
  }

  Centers.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            name: json["name"],
            address: json["address"],
            imgRout: json["imgRoute"]);

  Map<String, dynamic> toJson() =>
      {"name": name, "address": address, "imgRoute": imgRout};
}
