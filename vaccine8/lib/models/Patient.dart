class Patient {
  String name;
  String imageRoute;
  String address;
  DateTime pcrAppointment;
  DateTime vaccineFirstDose;
  DateTime vaccineSecondDose;
  String pcrCenter;
  String vaccineCenter;
  bool hasPcrAppointment;
  bool hasVaccineAppointments;

  Patient({
    this.name,
    this.imageRoute,
    this.address,
    this.pcrAppointment,
    this.vaccineFirstDose,
    this.vaccineSecondDose,
    this.pcrCenter,
    this.vaccineCenter,
    this.hasPcrAppointment = false,
    this.hasVaccineAppointments = false,
  });

  Patient.copy(Patient from)
      : this(
            name: from.name,
            imageRoute: from.imageRoute,
            address: from.address,
            pcrAppointment: from.pcrAppointment,
            hasPcrAppointment: from.hasPcrAppointment);

  // get appointment => pcrAppointment;
  // set appointment(value) => pcrAppointment = value;

  // get appointment => pcrAppointment;
  // set appointment(value) => pcrAppointment = value;
  // get appointment => pcrAppointment;
  // set appointment(value) => pcrAppointment = value;
}
