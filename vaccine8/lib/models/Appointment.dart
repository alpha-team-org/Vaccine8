class Appointment {
  List<int> time;
  DateTime date;
  Appointment(this.date, this.time);
 
  Appointment.copy(Appointment from) : this(from.date, [...from.time]);
}
