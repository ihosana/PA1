import 'package:floor/floor.dart';

@Entity()
class UsuarioBD {
  @PrimaryKey(autoGenerate: true)
 

  final String nome;
  final int cpf;
  final String login;
  final bool isAdm;
  final int senha;
  UsuarioBD(
       this.nome,
       this.cpf,
       this.login,
       this.isAdm,
       this.senha);
}