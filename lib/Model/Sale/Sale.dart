import 'package:pa1_activy/Model/User/User.dart';

class Sale {
  final int numero;
  final DateTime dataVenda;
  final String observacoes;
  final User user;
  Sale(
      {required this.numero,
        required this.dataVenda,
        required this.observacoes,
        required this.user});
}
