import 'package:floor/floor.dart';
import 'package:pa1_activy/model/Produto.dart';
import 'package:pa1_activy/model/ProdutoBD.dart';

@dao
abstract class ProdutoDao {
  @Query('SELECT * FROM Produto')
  Future<List<ProdutoBD>> getAll();

  @insert
  Future<int> insertProduto(ProdutoBD produto);

  @update
  Future<void> updateProduto(ProdutoBD produto);

  @delete
  Future<void> deleteProduto(ProdutoBD produto);
}