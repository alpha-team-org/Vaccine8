class Appointment {
  DateTime date;
  Appointment(
    this.date,
  );
  Appointment.copy(Appointment from) : this(from.date);
}