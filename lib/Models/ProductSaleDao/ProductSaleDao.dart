import 'package:floor/floor.dart';
import 'package:pa1_activy/Models/ProductSaleDao/ProductSaleDB.dart';

@dao
abstract class ProductSaleDao {
  @Query('SELECT * FROM ProductSaleDB')
  Future<List<ProductSaleDB>> getAll();

  @insert
  Future<int> insertProductSale(ProductSaleDB productsaleDB);

  @update
  Future<void> updateProductSale(ProductSaleDB productsaleDB);

  @delete
  Future<void> deleteProductSale(ProductSaleDB productsaleDB);
}