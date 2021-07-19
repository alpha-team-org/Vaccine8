class Medicine {
  dynamic id;
  dynamic appointmentId;
  String name;

  Medicine({this.id, this.name, this.appointmentId});
  Medicine.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            appointmentId: json['appointmentId'],
            name: json['name']);

  Map<String, dynamic> toJson() =>
      {'appointmentId': appointmentId, 'name': name};
}
