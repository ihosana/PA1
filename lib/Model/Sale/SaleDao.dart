import 'package:floor/floor.dart';
import 'package:pa1_activy/Model/Sale/Sale.dart';

@dao
abstract class SaleDao {
  @Query('SELECT * FROM SaleDB')
  Future<List<Sale>> getAll();

  @insert
  Future<int> insertSale(Sale sale);

  @update
  Future<void> updateSale(Sale sale);

  @delete
  Future<void> deleteSale(Sale sale);
}