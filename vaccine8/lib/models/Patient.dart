class Patient {
  String name;
  String imageRoute;
  String address;
  DateTime pcrAppointment;
  String center;
  bool hasPcrAppointment;

  Patient(
      {this.name,
      this.imageRoute,
      this.address,
      this.pcrAppointment,
      this.center,
      this.hasPcrAppointment = false});

  Patient.copy(Patient from)
      : this(
            name: from.name,
            imageRoute: from.imageRoute,
            address: from.address,
            pcrAppointment: from.pcrAppointment,
            hasPcrAppointment: from.hasPcrAppointment);

  get appointment => pcrAppointment;
  set appointment(value) => pcrAppointment = value;
}
