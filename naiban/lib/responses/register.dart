// To parse this JSON data, do
//
//     final RegisterResponse = RegisterResponseFromMap(jsonString);

import 'dart:convert';

import '../models/_models.dart';

RegisterResponse registerResponseFromMap(String str) =>
    RegisterResponse.fromMap(json.decode(str));

String registerResponseToMap(RegisterResponse data) =>
    json.encode(data.toMap());

class RegisterResponse {
  RegisterResponse({
    required this.ok,
    this.msg,
    required this.user,
    required this.code,
  });

  bool ok;
  String? msg;
  User user;
  int code;

  factory RegisterResponse.fromMap(Map<String, dynamic> json) =>
      RegisterResponse(
        ok: json["ok"],
        msg: json["msg"],
        user: User.fromMap(json["user"]),
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "msg": msg,
        "user": user.toMap(),
        "code": code,
      };
}
