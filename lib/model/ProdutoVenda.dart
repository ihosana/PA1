import 'dart:convert';
import 'dart:io';

import 'package:pa1_activy/model/Produto.dart';
import 'package:pa1_activy/model/Venda.dart';
//import 'package:http/http.dart' as http;
//import 'package:json_annotation/json_annotation.dart';

class ProdutoVenda {
  final double preco;
  final int quantidade;
  final int subTotal;
  final Produto produto;
  final Venda venda;
  ProdutoVenda(
      {required this.preco,
      required this.quantidade,
      required this.subTotal,
      required this.produto,
      required this.venda});
}
