import 'package:flutter/material.dart';
import 'package:pa1_activy/Pages/Admin/CadastroProduto/CadastroProduto.dart';

// Crie páginas separadas para Produtos, Transações e Análises.
class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CadastroProduto();
  }
}

class TransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Transações Financeiras',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class AnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Análises de Dados',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdmRoutingPage(),
    );
  }
}

class AdmRoutingPage extends StatefulWidget {
  @override
  _AdmRoutingPageState createState() => _AdmRoutingPageState();
}

class _AdmRoutingPageState extends State<AdmRoutingPage> {
  int _selectedIndex = 0;

  // Lista de widgets que serão chamados pela BottomNavigationBar
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(), // HomePage é o primeiro Widget
    ProductsPage(),
    TransactionsPage(),
    AnalysisPage(),
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
                'Administrador',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black, // Define a cor do texto como preto
                ),
              ),
            ),
            Spacer(), // Adiciona um espaço flexível entre o texto do título e os ícones
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
              icon: Icon(Icons.shopping_basket),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_vert),
              label: 'Transações',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'Análises',
              
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

// Página inicial com exemplos estáticos dos dashboards
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Resumo de Vendas',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Definindo bordas arredondadas
            child: Image.asset(
              'assets/column.png', // Caminho da imagem
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Produtos em Destaque',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), // Definindo bordas arredondadas
            child: Image.asset(
              'assets/column.png', // Caminho da imagem
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
