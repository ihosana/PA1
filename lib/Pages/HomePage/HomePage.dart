import 'package:flutter/material.dart';
import 'package:pa1_activy/Models/Product/Product.dart';
import 'Components/categories.dart'; // Importando os widgets RectangularItem e SquareItem

class HomePage extends StatelessWidget {
  // Definindo a escala desejada para as imagens
  static const double imageScale = 0.15; // Reduzindo a escala da imagem
   
  // Lista de produtos
  final List<Product> products = [
   Product(name: 'Gaming', price: 100, imagePath: 'assets/gaming.png', description: 'Description for Product 1', category: 'Category 1', code: 12343),
     // Adicione mais produtos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    // Utilizando apenas os primeiros 6 produtos da lista
    List<Product> displayedProducts = products.take(6).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildSectionTitle('Section 1'),
                    SizedBox(height: 8), // Reduzindo o espaçamento entre os elementos
                    Row(
                      children: displayedProducts
                          .where((product) => product.code == 123)
                          .map((product) => RectangularItem(name: product.description, imagePath: product.imagePath))
                          .toList(),
                    ),
                    SizedBox(height: 8), // Reduzindo o espaçamento entre os elementos
                    Row(
                      children: [
                        for (var i = 0; i < displayedProducts.length; i++)
                          if (displayedProducts[i].code == 123)
                            ...[
                              SquareItem(
                                name: displayedProducts[i].description,
                                imagePath: displayedProducts[i].imagePath,
                                squareHeight: 80,
                                squareWidth: 60,
                              ),
                              if (i < displayedProducts.length - 1) SizedBox(width: 8), // Adicionando espaçamento entre os quadrados, exceto para o último
                            ],
                      ],
                    ),
                    SizedBox(height: 16), // Adicionando espaço extra no final da coluna
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}