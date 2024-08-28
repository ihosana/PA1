import 'package:floor/floor.dart';
import 'package:pa1_activy/Models/ProductSaleDao/ProductSale.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM ProductDao')
  Future<List<ProductSale>> getAll();

  @insert
  Future<int> insertSale(ProductSale productsale);

  @update
  Future<void> updateSale(ProductSale productsale);

  @delete
  Future<void> deleteSale(ProductSale productsale);
}