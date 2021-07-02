import 'package:flutter/material.dart';

class Appointment {
  dynamic id;
  dynamic centerId;
  dynamic applicantId;
  String type;
  DateTime day;
  List<DateTime> time ;
  bool isSelected;
  Appointment({
    this.day,
    this.time,
    this.id,
    this.centerId,
    this.applicantId,
    this.type,
    this.isSelected = false,
  });
  Appointment.copy(Appointment from)
      : this(day: from.day, time: [...from.time], isSelected: from.isSelected);

  Appointment.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          centerId: json["centerId"],
          applicantId: json["applicantId"],
          type: json["type"],
          day: json["day"],
          time: [...json["date"]],
          isSelected: json["isSelected"],
        );

  Map<String, dynamic> toJson() => {
        "id": id,
        "centerId": centerId,
        "applicantId": applicantId,
        "type": type,
        "day": day,
        "time": time.toString(),
        "isSelected": isSelected,
      };

  void toggleStatus() => isSelected = !isSelected;
}