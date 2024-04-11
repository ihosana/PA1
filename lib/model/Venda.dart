import 'dart:convert';
import 'dart:io';

import 'package:pa1_activy/model/Usuario.dart';
//import 'package:http/http.dart' as http;
//import 'package:json_annotation/json_annotation.dart';

class Venda {
  final int numero;
  final DateTime dataVenda;
  final String observacoes;
  final Usuario usuario;
  Venda(
      {required this.numero,
      required this.dataVenda,
      required this.observacoes,
      required this.usuario});
}
