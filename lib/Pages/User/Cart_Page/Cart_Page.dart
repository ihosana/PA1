import 'package:flutter/material.dart';
import 'package:pa1_activy/Models/ProductSaleDao/ProductSaleDB.dart';
import 'package:pa1_activy/Models/Sale/SaleDB.dart';
import 'package:pa1_activy/Pages/RoutingPages/RoutingPage.dart';
import 'package:pa1_activy/Pages/User/Autentication/UserSession.dart';
import 'package:pa1_activy/Pages/User/Car_manage/CartManager.dart';
import 'package:pa1_activy/Models/Product/ProductDB.dart';
import 'package:pa1_activy/Pages/User/Cart/Cart_Item.dart';
import 'package:pa1_activy/dataBase/DataBaseFinal2.dart';

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
                      imageUrl:
                          "https://www.compumaq.com.br/loja/img/produtos/0022338.jpg",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Row(
                  children: [
                    Text('Tudo', style: TextStyle(color: Colors.grey.shade800)),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'R\$${total.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        await finalizarVenda(
                            context, cartProducts, cartManager.cartQuantities);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Venda finalizada com sucesso!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
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
    final appDatabase =
        await $FloorDataBase.databaseBuilder('DataBaseFinal2.db').build();
    final dao = appDatabase.productDao;
    return dao.getAll();
  }
}

Future<void> finalizarVenda(
    context, List<ProductDB> cartProducts, Map<int, int> cartQuantities) async {
  final appDatabase =
      await $FloorDataBase.databaseBuilder('DataBaseFinal2.db').build();
  final productSaleDao = appDatabase.productSaleDao;
  final saleDao = appDatabase.saleDao;
  final currentDate = DateTime.now();
  final cpf = UserSession.getUserCpf();
  final sale = SaleDB(null, currentDate.toString(), cpf);
  final saleId = await saleDao.insertSale(sale);

  for (final product in cartProducts) {
    final quantity = cartQuantities[product.code] ?? 0;
    final subTotal = product.price * quantity;

    final productSale =
        ProductSaleDB(null, quantity, subTotal.toInt(), product.code, saleId);
    await productSaleDao.insertProductSale(productSale);
  }
  CartManager().clearCart();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => RoutingPage()),
    (Route<dynamic> route) => false,
  );
  /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ListarSale()),
        );  */
}
