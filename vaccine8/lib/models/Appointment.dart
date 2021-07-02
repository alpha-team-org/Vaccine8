import 'package:flutter/material.dart';

class Appointment {
  dynamic id;
  dynamic centerId;
  dynamic applicantId;
  String type;
  DateTime day;
  set userId(value) => applicantId = value;
  Appointment({
    this.day=null,
    this.id,
    this.centerId,
    this.applicantId,
    this.type="",
  });
  Appointment.copy(Appointment from)
      : this(
          day: from.day,
        );

  Appointment.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          centerId: json["centerId"],
          applicantId: json["applicantId"],
          type: json["type"],
          day: DateTime.parse(json["day"]),
        );

  Map<String, dynamic> toJson() => {
        "id": id,
        "centerId": centerId,
        "applicantId": applicantId,
        "type": type,
        "day": day.toString(),
      };

  // void toggleStatus() => isSelected = !isSelected;
}
