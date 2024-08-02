import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // Certifique-se de que o pacote intl está importado
import 'package:pa1_activy/Models/Product/ProductDB.dart';
import 'package:pa1_activy/Pages/CadastroPage/CadastroPage.dart';
import 'package:pa1_activy/Pages/RoutingPages/AdmRoutingPage.dart';
import 'package:pa1_activy/dataBase/DataBase2.dart';

class CadastroProduto extends StatefulWidget {
  @override
  _CadastroPro createState() => _CadastroPro();
}

class _CadastroPro extends State<CadastroProduto> {
  final TextEditingController name = TextEditingController();
  final TextEditingController code = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  String selectedCategory = 'Eletrônicos'; // Valor inicial para o dropdown

  // Lista de categorias
  final List<String> categories = ['Eletrônicos', 'Periféricos', 'Monitores', 'Smartphones'];

  final String imagePath = " image";

  // Método para salvar o usuário no banco de dados
  void _saveProduct() async {
    final appDatabase =
        await $FloorDataBase.databaseBuilder('DataBase2.db').build();
    final dao = appDatabase.productDao;

    // Remove tudo que não é dígito ou vírgula
    String priceText = price.text.replaceAll(RegExp(r'[^\d,]'), '');
    // Substitui a vírgula por ponto para a conversão
    double priceValue = double.tryParse(priceText.replaceAll(',', '.')) ?? 0;

    var novoProduto = ProductDB(
      
      name.text,
      int.parse(code.text),
      description.text,
      priceValue,
      imagePath,
      selectedCategory
      
    );
    dao.insertProduct(novoProduto);
   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdmRoutingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            // Se quiser adicionar um gradiente, descomente as linhas abaixo
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [Colors.black, Colors.grey[900]!],
            // ),
          ),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                labelText: 'Nome do produto',
                                prefixIcon: Icon(Icons.near_me_outlined),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: description,
                              decoration: InputDecoration(
                                labelText: 'Descrição',
                                prefixIcon: Icon(Icons.description),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: code,
                              decoration: InputDecoration(
                                labelText: 'Código',
                                prefixIcon: Icon(Icons.code),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: price,
                              decoration: InputDecoration(
                                labelText: 'Preço',
                                prefixIcon: Icon(Icons.attach_money),
                              ),
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              inputFormatters: [
                                _CurrencyInputFormatter(), // Usar formatter personalizado
                              ],
                            ),
                            SizedBox(height: 20),
                            DropdownButtonFormField<String>(
                              value: selectedCategory,
                              decoration: InputDecoration(
                                labelText: 'Categoria',
                                prefixIcon: Icon(Icons.category_outlined),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedCategory = newValue!;
                                });
                              },
                              items: categories.map((category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Text(category),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      SizedBox(height: 45.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () { _saveProduct(); },
                          child: Text('Cadastrar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Formatter personalizado para adicionar vírgula
class _CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.simpleCurrency(locale: 'pt_BR', name: 'BRL');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove tudo que não for dígito
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Adiciona o ponto decimal
    String formattedText = '';
    int length = newText.length;
    if (length > 2) {
      formattedText = newText.substring(0, length - 2) + ',' + newText.substring(length - 2);
    } else {
      formattedText = '0,' + newText.padLeft(2, '0');
    }

    // Formata o texto final
    StringBuffer buffer = StringBuffer();
    int index = 0;
    for (int i = formattedText.length - 1; i >= 0; i--) {
      if (index > 0 && index % 3 == 0 && formattedText[i] != ',') {
        buffer.write('.');
      }
      buffer.write(formattedText[i]);
      index++;
    }

    // Retorna o novo valor formatado
    return newValue.copyWith(
      text: buffer.toString().split('').reversed.join(), // Reverte a string final
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
