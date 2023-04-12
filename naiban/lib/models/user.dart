// To parse this JSON data, do
//
//     final User = userFromMap(jsonString);

import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

//* Se cambión de Usuario a User | nombre a user | se borró online

class User {
  User({
    required this.name,
    required this.email,
    required this.uid,
    required this.license,
    required this.creditCard,
  });

  String name, email, uid;
  bool license, creditCard;

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        uid: json["uid"],
        license: json["license"],
        creditCard: json["creditCard"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "uid": uid,
        "license": license,
        "creditCard": creditCard,
      };
}
