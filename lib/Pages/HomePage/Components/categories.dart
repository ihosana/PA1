import 'package:flutter/material.dart';

class RectangularItem extends StatelessWidget {
  final String name;
  final String imagePath;

  const RectangularItem({
    Key? key,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  height: 70,
                  width: 80,
                  fit: BoxFit.cover, // Evita que a imagem seja cortada
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquareItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final double squareHeight;
  final double squareWidth;

  const SquareItem({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.squareHeight,
    required this.squareWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculando a altura e largura da imagem com base na altura do quadrado
    double imageHeight = squareHeight - 24; // Subtraindo a margem interna ao redor da imagem
    double imageWidth = squareWidth - 24; // Subtraindo a margem interna ao redor da imagem

    return Expanded(
      child: Container(
        height: squareHeight,
        width: squareWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    height: imageHeight,
                    width: imageWidth,
                    fit: BoxFit.contain, // Evita que a imagem seja cortada
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              left: 0,
              right: 0,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}