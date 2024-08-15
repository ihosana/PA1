import 'package:flutter/material.dart';
import 'package:pa1_activy/dataBase/DataBase3.dart';
import 'package:pa1_activy/Models/Product/ProductDB.dart';

class ListarP extends StatefulWidget {
  const ListarP({super.key});

  @override
  _ListarPState createState() => _ListarPState();
}

class _ListarPState extends State<ListarP> {
  // Controlador do TextField
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  // Mapa para armazenar a quantidade de cada produto no carrinho
  Map<int, int> cartQuantities = {};

  @override
  void initState() {
    super.initState();
    // Adiciona um listener para atualizar a consulta de pesquisa
    _searchController.addListener(() {
      setState(() {
        searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(31, 124, 124, 124),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Pesquisar...',
              border: InputBorder.none,
              icon: Icon(Icons.search, color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),
      ),
      body: FutureBuilder<List<ProductDB>>(
        future: findProduct('%$searchQuery%'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Produtos não achados"),
            );
          }

          // Filtra a lista de produtos com base na consulta de pesquisa
          List<ProductDB> filteredProducts = snapshot.data!;
            const id=0;
          return ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              ProductDB product = filteredProducts[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  leading: Image.network(
                    "https://www.compumaq.com.br/loja/img/produtos/0022338.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text("R\$ ${product.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                          icon: Icon(Icons.shopping_cart, color: Colors.blue),
                          onPressed: () {
                     //       _updateQuantity(product.id, 1);
                          },
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _updateQuantity(int productId, int change) {
    setState(() {
      // Atualiza a quantidade no mapa
      final currentQuantity = cartQuantities[productId] ?? 0;
      final newQuantity = currentQuantity + change;

      if (newQuantity > 0) {
        cartQuantities[productId] = newQuantity;
      } else {
        cartQuantities.remove(productId);
      }
    });
  }

  Future<List<ProductDB>> _loadProductData() async {
    final appDatabase = await $FloorDataBase.databaseBuilder('DataBase3.db').build();
    final dao = appDatabase.productDao;
    return dao.getAll();
  }

  Future<List<ProductDB>> findProduct(nome) async {
    final appDatabase = await $FloorDataBase.databaseBuilder('DataBase3.db').build();
    final dao = appDatabase.productDao;
    return dao.findProductsByName(nome);
  }
}
