import 'package:floor/floor.dart';
import 'package:pa1_activy/Models/User/UserDB.dart';
@Entity(
    tableName: 'product_sale',
  foreignKeys: [
    ForeignKey(
      childColumns: ['user'],
      parentColumns: ['cpf'],
      entity: UserDB,
    ),
  ]
)
class SaleDB {
  
  @PrimaryKey()
  final int numero;
  final String dataVenda;
  
   @ColumnInfo(name: 'user')
  final int user;
  SaleDB(
       this.numero,
       this.dataVenda,
       this.user);
}
