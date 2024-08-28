import 'package:floor/floor.dart';
import 'package:pa1_activy/Models/User/UserDB.dart';
@Entity(
  foreignKeys: [
    ForeignKey(
      childColumns: ['user'],
      parentColumns: ['cpf'],
      entity: UserDB,
    ),
  ]
)
class SaleDB {
  
  @PrimaryKey(autoGenerate: true)
  final int? numero;
  
  final String dataVenda;
  
   @ColumnInfo(name: 'user')
  final int user;
  SaleDB(
       this.numero,
       this.dataVenda,
       this.user);
}
