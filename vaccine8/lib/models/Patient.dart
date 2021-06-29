class Patient {
  String name;
  String _password;
  String imageRoute;
  String address;
  DateTime pcrAppointment;
  DateTime vaccineFirstDose;
  DateTime vaccineSecondDose;
  String pcrCenter;
  String vaccineCenter;
  bool hasPcrAppointment;
  bool hasVaccineAppointments;

  get password => _password;
  set password(value) => _password = value;

  Patient({
    this.name,
    String password = '',
    this.imageRoute,
    this.address,
    this.pcrAppointment,
    this.vaccineFirstDose,
    this.vaccineSecondDose,
    this.pcrCenter,
    this.vaccineCenter,
    this.hasPcrAppointment = false,
    this.hasVaccineAppointments = false,
  }) : _password = password;

  Patient.copy(Patient from)
      : this(
            name: from.name,
            password: from.password,
            imageRoute: from.imageRoute,
            address: from.address,
            pcrAppointment: from.pcrAppointment,
            hasPcrAppointment: from.hasPcrAppointment);

  Patient.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          password: json['password'],
          imageRoute: json['imageRoute'],
          address: json['address'],
          pcrAppointment: json['pcrAppointment'],
          vaccineFirstDose: json['vaccineFirstDose'],
          vaccineSecondDose: json['vaccineSecondDose'],
          pcrCenter: json['pcrCenter'],
          vaccineCenter: json['vaccineCenter'],
          hasPcrAppointment: json['hasPcrAppointment'],
          hasVaccineAppointments: json['hasVaccineAppointments'],
        );

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
        'imageRoute': imageRoute,
        'address': address,
        'pcrAppointment': pcrAppointment,
        'vaccineFirstDose': vaccineFirstDose,
        'vaccineSecondDose': vaccineSecondDose,
        'pcrCenter': pcrCenter,
        'vaccineCenter': vaccineCenter,
        'hasPcrAppointment': hasPcrAppointment,
        'hasVaccineAppointments': hasVaccineAppointments,
      };
  // get appointment => pcrAppointment;
  // set appointment(value) => pcrAppointment = value;

  // get appointment => pcrAppointment;
  // set appointment(value) => pcrAppointment = value;
  // get appointment => pcrAppointment;
  // set appointment(value) => pcrAppointment = value;

}
