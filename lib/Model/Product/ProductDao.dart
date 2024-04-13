import 'package:floor/floor.dart';
import 'package:pa1_activy/Model/Product/Product.dart';
import 'package:pa1_activy/Model/Product/ProductDB.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM ProductDB')
  Future<List<ProductDB>> getAll();

  @insert
  Future<int> insertProduct(ProductDB product);

  @update
  Future<void> updateProduct(ProductDB product);

  @delete
  Future<void> deleteProduct(ProductDB product);
}