class Patient {
  int id;
  String name;
  String password;
  String imageRoute;
  String address;
  DateTime pcrAppointment;
  DateTime vaccineFirstDose;
  DateTime vaccineSecondDose;
  bool hasPcrAppointment;
  bool hasVaccineAppointments;

  Patient({
    this.id,
    this.name = "",
    this.password = "",
    this.imageRoute = "",
    this.address = "",
    // this.pcrAppointment=null,
    // this.vaccineFirstDose =null,
    // this.vaccineSecondDose= null,
    this.hasPcrAppointment = false,
    this.hasVaccineAppointments = false,
  });

  Patient.copy(Patient from)
      : this(
            id: from.id,
            name: from.name,
            password: from.password,
            imageRoute: from.imageRoute,
            address: from.address,
            hasPcrAppointment: from.hasPcrAppointment);

  // get appointment => pcrAppointment;
  // set appointment(value) => pcrAppointment = value;

  // get appointment => pcrAppointment;
  // set appointment(value) => pcrAppointment = value;
  // get appointment => pcrAppointment;
  // set appointment(value) => pcrAppointment = value;

// Patient.fromJson(Map<String ,dynamic> json):
// this
//   (id:json['id'],
//   );
  


}
