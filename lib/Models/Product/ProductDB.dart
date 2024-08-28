import 'package:floor/floor.dart';

@Entity()
class ProductDB  {
  
  final String name;
  @PrimaryKey()
  final int code;
  final String description;
  final double price;
  final String imagePath;
  final String category;
  ProductDB(this.name, this.code, this.description, this.price, this.imagePath,
      this.category);
}
