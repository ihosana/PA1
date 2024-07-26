import 'package:flutter/material.dart';

import '../HomePage/HomePage.dart';

class RoutingPage extends StatefulWidget {
  @override
  _RoutingPageState createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  int _selectedIndex = 0;

  final List<String> addresses = [
    'Rua A, 123',
    'Avenida B, 456',
    'Travessa C, 789',
    'Alameda D, 1011',
  ];

  // Lista de widgets que serão chamados pela BottomNavigationBar
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(), // HomePage é o primeiro Widget
    Container(
      color: Colors.blue,
      child: Center(child: Text('Busca')),
    ),
    Container(
      color: Colors.green,
      child: Center(child: Text('Carrinho')),
    ),
    Container(
      color: Colors.orange,
      child: Center(child: Text('Opções')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o botão de voltar da AppBar
        backgroundColor: Colors.white, // Define o fundo da AppBar como branco
        titleSpacing: 0, // Remove o espaçamento padrão do título da AppBar
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                addresses[0],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black, // Define a cor do texto como preto
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down, // Ícone de seta para baixo para selecionar o endereço
              color: Colors.black, // Define a cor da seta como preto
            ),
            Spacer(), // Adiciona um espaço flexível entre o texto do endereço e os ícones
            IconButton(
              icon: Icon(Icons.notifications), // Ícone de sino no canto direito
              onPressed: () {
                // Adicione sua lógica para ação do ícone de sino aqui
              },
              color: Colors.black, // Define a cor do ícone do sino como preto
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex], // Mostra o widget selecionado pelo BottomNavigationBar
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white, // Definindo a cor de fundo da BottomNavigationBar como branco
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Busca',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Carrinho',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Opções',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}