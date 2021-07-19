import 'package:vaccine8/models/appointment.dart';

class Centers {
  dynamic id;
  String name;
  String address;
  String location;
  List<Appointment> appointments;
  String imgRout;
  Centers(
      {this.id,
      this.name = "",
      this.address = "",
      this.location = "",
      this.appointments,
      this.imgRout = ""});

  Centers.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            name: json["name"],
            address: json["address"],
            location: json["location"],
            imgRout: json["imgRoute"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "location": location,
        "imgRoute": imgRout
      };
}
