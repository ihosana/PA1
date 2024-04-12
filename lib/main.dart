import 'package:flutter/material.dart';
import 'package:pa1_activy/Listar.dart';
import 'package:pa1_activy/cadastro.dart';
import 'package:pa1_activy/dataBase/AppDatabase.dart';
import 'package:pa1_activy/model/Usuario.dart';
import 'package:pa1_activy/model/UsuarioBD.dart';
import 'package:pa1_activy/model/UsuarioDao.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Listar() ;
  }
}
