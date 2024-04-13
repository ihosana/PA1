import 'dart:convert';
import 'dart:io';
import 'package:floor/floor.dart';
//import 'package:http/http.dart' as http;
//import 'package:json_annotation/json_annotation.dart';

class Product {
  final String name;
  final int code;
  final String description;
  final double price;
  final String imagePath;
  final String category;
  Product(
      {
      required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.imagePath,
      required this.category,
      });
}
