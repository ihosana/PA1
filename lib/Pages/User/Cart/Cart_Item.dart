import 'package:flutter/material.dart';
class CartItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String qtd;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const CartItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.qtd,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(imageUrl, width: 50, height: 50),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                    Text(
                      price,
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                   
                  ],
                ),
              ),
              // Botões de quantidade
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.black),
                    onPressed: () {
                      if (quantity > 1) {
                        onQuantityChanged(quantity - 1);
                      }
                    },
                  ),
                  Text(
                      '$quantity',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.black),
                    onPressed: () {
                      onQuantityChanged(quantity + 1);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
