import 'package:floor/floor.dart';

@Entity()
class ProductDB {
  @PrimaryKey(autoGenerate: true)

  final int code;
  final String description;
  final double price;
  final String imagePath;
  final String category;
  ProductDB(this.code, this.description, this.price, this.imagePath, this.category);
}
