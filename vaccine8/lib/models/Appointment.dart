import 'package:flutter/material.dart';

class Appointment {
  DateTime day;
  List<TimeOfDay> date;
  bool isSelected;
  Appointment({
    this.day,
    this.date,
    this.isSelected = false,
  });
  Appointment.copy(Appointment from)
      : this(day: from.day, date: [...from.date], isSelected: from.isSelected);

  void toggleStatus() => isSelected = !isSelected;
}
