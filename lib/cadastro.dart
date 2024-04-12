import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pa1_activy/dataBase/AppDatabase.dart'; // Importe o banco de dados aqui
import 'package:pa1_activy/model/UsuarioBD.dart'; // Importe o modelo de usuário aqui

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController cpf = TextEditingController();
  final TextEditingController login = TextEditingController();
   bool isAdm =false;
  
  final TextEditingController senha = TextEditingController();

  // Método para salvar o usuário no banco de dados
  void _salvarUsuario() async {
   
    final appDatabase = await $FloorAppDatabase.databaseBuilder('AppDatabase.db').build();
    final dao = appDatabase.usuarioDao;

    var novoUsuario = UsuarioBD(_nomeController.text,int.parse(cpf.text),login.text, isAdm, int.parse(senha.text));
  
    dao.insertUsuario(novoUsuario);

    // Você pode adicionar alguma lógica adicional após salvar o usuário, como exibir uma mensagem ou navegar para outra tela
  
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
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
              controller: senha,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 45.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _salvarUsuario,
                child: Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }

}