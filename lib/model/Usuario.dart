import 'dart:convert';
import 'dart:io';

import 'package:pa1_activy/model/UsuarioBD.dart';
//import 'package:http/http.dart' as http;
//import 'package:json_annotation/json_annotation.dart';

class Usuario {
  final String nome;
  final int cpf;
  final String login;
  final bool isAdm;
  final int senha;
  Usuario(
      {
      required this.nome,
      required this.cpf,
      required this.login,
      required this.isAdm,
      required this.senha});
}


