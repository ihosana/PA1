import 'package:floor/floor.dart';
import 'package:pa1_activy/model/Produto.dart';
import 'package:pa1_activy/model/Venda.dart';

@dao
abstract class VendaDao {
  @Query('SELECT * FROM Venda')
  Future<List<Venda>> getAll();

  @insert
  Future<int> insertVenda(Venda venda);

  @update
  Future<void> updateVenda(Venda venda);

  @delete
  Future<void> deleteVenda(Venda venda);
}