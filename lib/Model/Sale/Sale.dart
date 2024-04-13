import 'dart:convert';
import 'dart:io';

import 'package:pa1_activy/Model/User/User.dart';
//import 'package:http/http.dart' as http;
//import 'package:json_annotation/json_annotation.dart';

class Sale {
  final int numero;
  final DateTime dataVenda;
  final String observacoes;
  final User usuario;
  Sale(
      {required this.numero,
      required this.dataVenda,
      required this.observacoes,
      required this.usuario});
}
