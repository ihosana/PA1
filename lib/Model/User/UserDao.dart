import 'package:floor/floor.dart';
import 'package:pa1_activy/Model/Product/Product.dart';
import 'package:pa1_activy/Model/User/User.dart';
import 'package:pa1_activy/Model/User/UserDB.dart';
import 'package:pa1_activy/Model/Sale/Sale.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM UserDB')
  Future<List<UserDB>> getAll();

  @insert
  Future<int> insertUser(UserDB user);

  @update
  Future<void> updateUser(UserDB user);

  @delete
  Future<void> deleteUser(UserDB user);

//  @Query('SELECT * UsuarioBD WHERE cpf=?')
  //Future<List<UsuarioBD>> getAllByCpf();
}