// To parse this JSON data, do
//
//     final logInResponse = logInResponseFromMap(jsonString);

import 'dart:convert';

import '../models/_models.dart';

LogInResponse logInResponseFromMap(String str) =>
    LogInResponse.fromMap(json.decode(str));

String logInResponseToMap(LogInResponse data) => json.encode(data.toMap());

class LogInResponse {
  LogInResponse({
    required this.ok,
    this.msg,
    required this.user,
    required this.token,
  });

  bool ok;
  String? msg;
  User user;
  String token;

  factory LogInResponse.fromMap(Map<String, dynamic> json) => LogInResponse(
        ok: json["ok"],
        msg: json["msg"],
        user: User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "msg": msg,
        "user": user.toMap(),
        "token": token,
      };
}
