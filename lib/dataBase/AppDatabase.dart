import 'dart:async';
import 'package:pa1_activy/model/ProdutoBD.dart';
import 'package:pa1_activy/model/UsuarioBD.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:pa1_activy/model/Produto.dart';
import 'package:pa1_activy/model/ProdutoDao.dart';
import 'package:pa1_activy/model/Usuario.dart';
import 'package:pa1_activy/model/UsuarioDao.dart';
part 'AppDatabase.g.dart';

@Database(version: 1, entities: [UsuarioBD,ProdutoBD])
abstract class AppDatabase extends FloorDatabase{
  UsuarioDao get usuarioDao;
  ProdutoDao get produtoDao;

}