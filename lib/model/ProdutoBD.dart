import 'package:floor/floor.dart';

@Entity()
class ProdutoBD {
  @PrimaryKey(autoGenerate: true)
  final int codigo;
  final String descricao;
  final double preco;
  ProdutoBD(this.codigo, this.descricao, this.preco);
}
