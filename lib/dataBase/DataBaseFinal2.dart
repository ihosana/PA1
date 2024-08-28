import 'dart:async';
import 'package:pa1_activy/Models/Product/ProductDB.dart';
import 'package:pa1_activy/Models/ProductSaleDao/ProductSaleDB.dart';
import 'package:pa1_activy/Models/ProductSaleDao/ProductSaleDao.dart';
import 'package:pa1_activy/Models/Sale/SaleDB.dart';
import 'package:pa1_activy/Models/Sale/SaleDao.dart';
import 'package:pa1_activy/Models/User/UserDB.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:pa1_activy/Models/Product/ProductDao.dart';
import 'package:pa1_activy/Models/User/UserDao.dart';
part 'DataBaseFinal2.g.dart';

@Database(version: 1, entities: [UserDB,ProductDB,ProductSaleDB, SaleDB ])
abstract class DataBase extends FloorDatabase{
  UserDao get usuarioDao;
  ProductDao get productDao;
  ProductSaleDao get productSaleDao; 
  SaleDao get saleDao;
} 