import 'package:flutter/material.dart';

class Appointment {
  dynamic id;
  dynamic centerId;
  dynamic applicantId;
  String type;
  DateTime day;
  String symptoms;
  String reply;
  bool approve;
  bool disapprove;

  get getSymptoms => symptoms;
  set setSymptoms(value) => symptoms = value;
  set userId(value) => applicantId = value;
  Appointment({
    this.day = null,
    this.id,
    this.centerId,
    this.applicantId,
    this.type = "",
    this.symptoms,
    this.reply,
    this.approve = false,
    this.disapprove = true,
  });
  // Appointment.copy(Appointment from)
  //     : this(
  //         day: from.day,
  //       );

  Appointment.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            centerId: json["centerId"],
            applicantId: json["applicantId"],
            type: json["type"],
            day: DateTime.parse(json["day"]),
            symptoms: json['symptoms'],
            reply: json['reply'],
            approve: json['approve'],
            disapprove: json['disapprove']);

  Map<String, dynamic> toJson() => {
        "centerId": centerId,
        "applicantId": applicantId,
        "type": type,
        "day": day.toString(),
        "symptoms": symptoms,
        "reply": reply,
        "approve": approve,
        "disapprove": disapprove
      };

  // void toggleStatus() => isSelected = !isSelected;
}
