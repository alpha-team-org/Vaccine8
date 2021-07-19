class Session {
  String token;
  dynamic userID;

  Session({this.token, this.userID});
  Session.fromJson(Map<String, dynamic> json)
      : this(token: json['token'], userID: json['userID']);
  Map<String, dynamic> toJson() => {'token': token, 'userID': userID};
}
