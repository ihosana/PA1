import 'package:flutter/material.dart';
import 'package:pa1_activy/Models/Product/ProductDB.dart';
import 'package:pa1_activy/Pages/User/Car_manage/CartManager.dart';
import 'package:pa1_activy/dataBase/DataBaseFinal2.dart';

class ListarP extends StatefulWidget {
  const ListarP({super.key});

  @override
  _ListarPState createState() => _ListarPState();
}

class _ListarPState extends State<ListarP> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
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

          List<ProductDB> filteredProducts = snapshot.data!;
          final cartManager = CartManager(); // Obtenha a instância do CartManager

          return ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              ProductDB product = filteredProducts[index];
              int quantity = cartManager.cartQuantities[product.code] ?? 0;

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
                  trailing: quantity > 0
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  cartManager.removeProduct(product.code);
                                });
                              },
                            ),
                            Text(
                              '$quantity',
                              style: TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  cartManager.addProduct(product.code);
                                });
                              },
                            ),
                          ],
                        )
                      : IconButton(
                          icon: Icon(Icons.shopping_cart, color: Colors.blue),
                          onPressed: () {
                            setState(() {
                              cartManager.addProduct(product.code);
                              
                            });
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

  Future<List<ProductDB>> findProduct(String nome) async {
    final appDatabase = await $FloorDataBase.databaseBuilder('DataBaseFinal2.db').build();
    final dao = appDatabase.productDao;
    return dao.findProductsByName(nome);
  }
}
