import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pa1_activy/Pages/LoginPage/LoginPage.dart';
import 'package:pa1_activy/dataBase/DataBase.dart'; // Importe o banco de dados aqui
import 'package:pa1_activy/Model/User/UserDB.dart'; // Importe o modelo de usuário aqui

class CadastroPage extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController cpf = TextEditingController();
  final TextEditingController login = TextEditingController();
  bool isAdm = false;
  final TextEditingController password = TextEditingController();

  // Método para salvar o usuário no banco de dados
  void _saveUser() async {
    final appDatabase =
        await $FloorDataBase.databaseBuilder('DataBase.db').build();
    final dao = appDatabase.usuarioDao;

    var novoUsuario = UserDB(name.text, int.parse(cpf.text),
        login.text, isAdm, int.parse(password.text));

    dao.insertUser(novoUsuario);

    // Você pode adicionar alguma lógica adicional após salvar o usuário, como exibir uma mensagem ou navegar para outra tela
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 9.0),
            TextField(
              controller: cpf,
              decoration: InputDecoration(labelText: 'cpf'),
            ),
            SizedBox(height: 9.0),
            TextField(
              controller: login,
              decoration: InputDecoration(labelText: 'login'),
            ),
            SizedBox(height: 9.0),
            Row(
              children: [
                Checkbox(
                  value: isAdm,
                  onChanged: (value) {
                    setState(() {
                      isAdm = value!;
                    });
                  },
                ),
                Text('Administrador'),
              ],
            ),
            SizedBox(height: 9.0),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 45.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveUser,
                child: Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
