import 'package:floor/floor.dart';
import 'package:pa1_activy/Models/Sale/SaleDB.dart';

@dao
abstract class SaleDao {
  @Query('SELECT * FROM SaleDB')
  Future<List<SaleDB>> getAll();

  @insert
  Future<int> insertSale(SaleDB sale);

  @update
  Future<void> updateSale(SaleDB sale);

  @delete
  Future<void> deleteSale(SaleDB sale);
}