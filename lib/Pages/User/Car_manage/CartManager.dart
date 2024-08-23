import 'package:pa1_activy/Models/Product/ProductDB.dart';
class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final Map<int, int> _cartQuantities = {};

  Map<int, int> get cartQuantities => _cartQuantities;

  void addProduct(int productId) {
    if (_cartQuantities.containsKey(productId)) {
      _cartQuantities[productId] = _cartQuantities[productId]! + 1;
      
    } else {
      _cartQuantities[productId] = 1;
    }
  }

  void removeProduct(int productId) {
    if (_cartQuantities.containsKey(productId)) {
      final quantity = _cartQuantities[productId]!;
      if (quantity > 1) {
        _cartQuantities[productId] = quantity - 1;
      } else {
        _cartQuantities.remove(productId);
      }
    }
  }

  double getTotal(List<ProductDB> products) {
    return products.fold(0, (sum, product) {
      final quantity = _cartQuantities[product.code] ?? 0;
      return sum + (product.price * quantity);
    });
  }

  List<ProductDB> getCartProducts(List<ProductDB> allProducts) {
    return allProducts.where((product) => _cartQuantities.containsKey(product.code)).toList();
  }
}
