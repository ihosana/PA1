import 'package:flutter/material.dart';
import 'package:pa1_activy/Pages/User/Car_manage/CartManager.dart';
import 'package:pa1_activy/Models/Product/ProductDB.dart';
import 'package:pa1_activy/Pages/User/Cart/Cart_Item.dart';
import 'package:pa1_activy/dataBase/DataBase3.dart'; 
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartManager cartManager;
  late Future<List<ProductDB>> futureProducts;

  @override
  void initState() {
    super.initState();
    cartManager = CartManager();
    futureProducts = _getAllProducts();
  }

  Future<void> _updateQuantity(ProductDB product, int newQuantity) async {
    setState(() {
      cartManager.cartQuantities[product.code] = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: FutureBuilder<List<ProductDB>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar produtos'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum produto encontrado'));
          }

          final allProducts = snapshot.data!;
          final cartProducts = cartManager.getCartProducts(allProducts);
          final total = cartManager.getTotal(cartProducts);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProducts.length,
                  itemBuilder: (context, index) {
                    final product = cartProducts[index];
                    final quantity = cartManager.cartQuantities[product.code]!;

                    return CartItem(
                      imageUrl: "https://www.compumaq.com.br/loja/img/produtos/0022338.jpg",
                      name: product.name,
                      price: 'R\$ ${(product.price)}',
                      qtd: 'Quantidade: ${(quantity)}',
                      quantity: quantity,
                      onQuantityChanged: (newQuantity) {
                        _updateQuantity(product, newQuantity);
                      },
                    );
                  },
                ),
              ),
              Container(
                color: Colors.grey.shade300,
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Row(
                  children: [
                    Checkbox(
                      shape: CircleBorder(),
                      value: false,
                      onChanged: (bool? value) {
                        // Ação ao marcar/desmarcar o checkbox
                      },
                    ),
                    Text('Tudo', style: TextStyle(color: Colors.grey.shade800)),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'R\$${total.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Ação ao clicar no botão "Continuar"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      ),
                      child: Text(
                        'Finalizar Venda (${cartManager.cartQuantities.length})',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<List<ProductDB>> _getAllProducts() async {
    final appDatabase = await $FloorDataBase.databaseBuilder('DataBase3.db').build();
    final dao = appDatabase.productDao;
    return dao.getAll();
  }
}
