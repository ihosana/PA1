import 'dart:convert';
import 'dart:io';

import 'package:pa1_activy/Model/Product/Product.dart';
import 'package:pa1_activy/Model/Sale/Sale.dart';
//import 'package:http/http.dart' as http;
//import 'package:json_annotation/json_annotation.dart';

class ProductSale {
  final double price;
  final int quantity;
  final int subTotal;
  final Product product;
  final Sale sale;
  ProductSale(
      {required this.price,
      required this.quantity,
      required this.subTotal,
      required this.product,
      required this.sale});
}
