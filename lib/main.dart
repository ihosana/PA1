import 'package:flutter/material.dart';
import 'package:pa1_activy/Pages/LoginPage/LoginPage.dart';
import 'Pages/RoutingPages/RoutingPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'SaleApp',
    theme: ThemeData.dark(),
    routes: {
      '/': (context) => LoginPage(), // Rota padrão para a página de login
      '/home': (context) => RoutingPage(), // Rota para a página inicial
    },
    initialRoute: '/', // Rota inicial
  ));
}