import 'dart:convert';

import 'package:flutter/material.dart';

class LoginRequest {
  LoginRequest(
      {@required this.email, @required this.password, @required this.remember});

  String email;
  String password;
  bool remember;

  factory LoginRequest.fromRawJson(String str) =>
      LoginRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json["email"],
        password: json["password"],
        remember: json["remember"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "remember": remember,
      };
}

class LoginResponse {
  LoginResponse(
      {@required this.token,
      @required this.id,
      @required this.subject,
      @required this.expiresAt});

  String id;
  String token;
  String subject;
  DateTime expiresAt;

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      token: json["token"],
      id: json["id"],
      subject: json["subject"],
      expiresAt: json["expiresAt"]);

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
        "subject": subject,
        "expiresAt": expiresAt
      };
}
