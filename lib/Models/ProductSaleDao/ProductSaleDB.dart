import 'package:floor/floor.dart';
import 'package:pa1_activy/Models/Product/ProductDB.dart';
import 'package:pa1_activy/Models/Sale/SaleDB.dart';

@Entity(
  foreignKeys: [
    ForeignKey(
      childColumns: ['product_id'],
      parentColumns: ['code'],
      entity: ProductDB,
    ),
    ForeignKey(
      childColumns: ['sale_id'],
      parentColumns: ['numero'],
      entity: SaleDB,
    ),
  ],
)
class ProductSaleDB {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  
  final int quantity;
  final int subTotal;
  final int product_id;
  final int sale_id;
  ProductSaleDB(
    this.id,
    this.quantity, this.subTotal, this.product_id, this.sale_id
    );
}
