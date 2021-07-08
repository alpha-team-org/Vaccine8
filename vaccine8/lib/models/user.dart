// import 'package:vaccine8/models/user.dart';

class User  {
  dynamic id;
  String name;
  String email;
  String _password;
  String _photoUrl;
  String address;
  bool isDr;


  get password => _password;
  set password(value) => _password = value;

  get photoUrl => _photoUrl;
  set photoUrl(value) => _photoUrl = value;

  User(
      {dynamic id,
      this.name,
      String password = '',
      String photoUrl = '',
      this.address,
      this.email,
      this.isDr,

      })
      : id = id,
        _photoUrl = photoUrl,
        _password = password;

  User.copy(User from)
      : this(
          id: from.id,
          name: from.name,
          password: from.password,
          photoUrl: from.photoUrl,
          address: from.address,
          email :from.email,
          isDr:from.isDr,
          
        );

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          password: json['password'],
          photoUrl: json['photoUrl'],
          address: json['address'],
          email:json['email'],
          isDr:json['isDr']
    
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'password': password,
        'photoUrl': photoUrl,
        'address': address,
        'email': email,
        'isDr': isDr,

      };


}