import 'package:floor/floor.dart';
import 'package:pa1_activy/model/Produto.dart';
import 'package:pa1_activy/model/Usuario.dart';
import 'package:pa1_activy/model/UsuarioBD.dart';
import 'package:pa1_activy/model/Venda.dart';

@dao
abstract class UsuarioDao {
  @Query('SELECT * FROM UsuarioBD')
  Future<List<UsuarioBD>> getAll();

  @insert
  Future<int> insertUsuario(UsuarioBD usuario);

  @update
  Future<void> updateUsuario(UsuarioBD usuario);

  @delete
  Future<void> deleteUsuario(UsuarioBD usuario);
}