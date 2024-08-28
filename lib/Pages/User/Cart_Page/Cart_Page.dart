import 'package:flutter/material.dart';
import 'package:pa1_activy/Models/ProductSaleDao/ProductSaleDB.dart';
import 'package:pa1_activy/Models/Sale/SaleDB.dart';
import 'package:pa1_activy/Pages/User/Car_manage/CartManager.dart';
import 'package:pa1_activy/Models/Product/ProductDB.dart';
import 'package:pa1_activy/Pages/User/Cart/Cart_Item.dart';
import 'package:pa1_activy/dataBase/DataBaseFinal1.dart'; 
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


  @override@override
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
                    onPressed: () async {
                      // Suponha que você tenha um método para obter o ID do usuário
                      int userId = 1; // Substitua pelo ID do usuário atual

                      // Chama a função para finalizar a venda
                      await finalizarVenda(cartProducts, cartManager.cartQuantities, userId);

                      // Exibe uma mensagem de sucesso ou navega para outra página
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Venda finalizada com sucesso!')),
                      );

                      // Opcionalmente, você pode navegar para outra página ou limpar o carrinho
                      // Navigator.pop(context);
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
    final appDatabase = await $FloorDataBase.databaseBuilder('DataBaseFinal1.db').build();
    final dao = appDatabase.productDao;
    return dao.getAll();
  }
}
 Future<void> finalizarVenda(List<ProductDB> cartProducts, Map<int, int> cartQuantities, int userId) async {
  final appDatabase = await $FloorDataBase.databaseBuilder('DataBaseFinal1.db').build();
  final productSaleDao = appDatabase.productSaleDao;
  final saleDao = appDatabase.saleDao;

  // Cria um novo registro de venda
  final currentDate = DateTime.now();
  
  final sale = SaleDB(7, currentDate.toString(), 78); // Use o userId aqui
  final saleId = await saleDao.insertSale(sale); // `insertSale` retorna o ID gerado

  // Insere cada item no banco de dados como um registro de venda de produto
  for (final product in cartProducts) {
    final quantity = cartQuantities[product.code] ?? 0;
    final subTotal = product.price * quantity;

    final productSale = ProductSaleDB(7, quantity, subTotal.toInt(), product.code, saleId);
    await productSaleDao.insertProductSale(productSale);
  //print("Data +${sale.dataVenda}");
  }
    
       /*  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ListarSale()),
        ); */
}
