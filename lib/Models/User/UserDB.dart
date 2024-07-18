import 'package:floor/floor.dart';

@Entity()
class UserDB {

  final String name;
  @PrimaryKey(autoGenerate: true)
  final int cpf;
  
  final String login;
  final bool isAdm;
  final int password;
  UserDB(
       this.name,
       this.cpf,
       this.login,
       this.isAdm,
       this.password);
}