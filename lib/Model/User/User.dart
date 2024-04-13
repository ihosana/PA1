import 'dart:convert';
import 'dart:io';

import 'package:pa1_activy/Model/User/UserDB.dart';
//import 'package:http/http.dart' as http;
//import 'package:json_annotation/json_annotation.dart';

class User {
  final String name;
  final int cpf;
  final String login;
  final bool isAdm;
  final int password;
  User(
      {
      required this.name,
      required this.cpf,
      required this.login,
      required this.isAdm,
      required this.password});
}


