import 'dart:convert';
import 'dart:io';
//import 'package:http/http.dart' as http;
//import 'package:json_annotation/json_annotation.dart';

class Produto {
  final int codigo;
  final String descricao;
  final double preco;
  Produto(
      {required this.codigo,
      required this.descricao,
      required this.preco});
}
