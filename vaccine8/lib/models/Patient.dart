class Patient {
  dynamic id;
  String name;
  String _password;
  String _photoUrl;
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

  get photoUrl => _photoUrl;
  set photoUrl(value) => _photoUrl = value;

  Patient({
    dynamic id,
    this.name,
    String password = '',
    String photoUrl = '',
    this.address,
    this.pcrAppointment,
    this.vaccineFirstDose,
    this.vaccineSecondDose,
    this.pcrCenter,
    this.vaccineCenter,
    this.hasPcrAppointment = false,
    this.hasVaccineAppointments = false,
  })  : id = id,
        _photoUrl = photoUrl,
        _password = password;

  Patient.copy(Patient from)
      : this(
            id: from.id,
            name: from.name,
            password: from.password,
            photoUrl: from.photoUrl,
            address: from.address,
            hasPcrAppointment: from.hasPcrAppointment);

  Patient.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          password: json['password'],
          photoUrl: json['photoUrl'],
          address: json['address'],
          // pcrAppointment: DateTime.parse(json[['pcrAppointment']]),
          // vaccineFirstDose: DateTime.parse(json['vaccineFirstDose']),
          // vaccineSecondDose: DateTime.parse(json['vaccineSecondDose']),
          pcrCenter: json['pcrCenter'],
          vaccineCenter: json['vaccineCenter'],
          hasPcrAppointment: json['hasPcrAppointment'],
          hasVaccineAppointments: json['hasVaccineAppointments'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'password': password,
        'photoUrl': photoUrl,
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
