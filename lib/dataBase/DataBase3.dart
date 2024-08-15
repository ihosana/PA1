import 'dart:async';
import 'package:pa1_activy/Models/Product/ProductDB.dart';
import 'package:pa1_activy/Models/User/UserDB.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:pa1_activy/Models/Product/ProductDao.dart';
import 'package:pa1_activy/Models/User/UserDao.dart';
part 'DataBase3.g.dart';

@Database(version: 1, entities: [UserDB,ProductDB])
abstract class DataBase extends FloorDatabase{
  UserDao get usuarioDao;
  ProductDao get productDao;
} 