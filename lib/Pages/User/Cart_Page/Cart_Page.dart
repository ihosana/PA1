import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool showTax = false; // Controle de exibição do imposto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CartItem(
                  imageUrl: 'https://via.placeholder.com/50', // Substitua pelo URL correto da imagem
                  name: 'Apple iPhone 15 Pro Max (512 GB) — Titânio preto',
                  price: 'R\$5.000,00',
                ),
                CartItem(
                  imageUrl: 'https://via.placeholder.com/50', // Substitua pelo URL correto da imagem
                  name: 'Teclado Xzone Gamer Semimecânico GTS-01, Iluminação em LED',
                  price: 'R\$150,00',
                ),
                CartItem(
                  imageUrl: 'https://via.placeholder.com/50', // Substitua pelo URL correto da imagem
                  name: 'Monitor Gamer Samsung Odyssey G5 34 Ultrawide, 165Hz, 1ms, HDR10, HDMI',
                  price: 'R\$3.400,00',
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade300, // Alterar cor de fundo para cinza claro
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              children: [
                Checkbox(
                  shape: CircleBorder(), // Checkbox redondo
                  value: false, // Desmarcado
                  onChanged: (bool? value) {
                    // Ação ao marcar/desmarcar o checkbox
                  },
                ),
                Text('Tudo', style: TextStyle(color: Colors.grey.shade800)), // Cor do texto para cinza escuro
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'R\$102,56', // Valor total atualizado
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey.shade800), // Cor do texto para cinza escuro
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
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Largura menor do botão
                  ),
                  child: Text(
                    'Continuar(2)',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const CartItem({required this.imageUrl, required this.name, required this.price});

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
              SizedBox(width: 10.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
