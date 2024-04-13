
import 'package:flutter/material.dart';
import 'package:pa1_activy/Listar.dart';
import 'package:pa1_activy/dataBase/AppDatabase.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController senha = TextEditingController();
  final TextEditingController login = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaleApp',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.grey[900]!],
            ),
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
                        padding: EdgeInsets.all(20.0),
                        child: Image.asset(
                          'assets/logo.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: login,
                              decoration: InputDecoration(
                                labelText: 'Login',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: senha,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => procurarUser(context),
                        child: Text('Entrar'),
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

  procurarUser(BuildContext context) async {
    final appDatabase = await $FloorAppDatabase.databaseBuilder('AppDatabase.db').build();
    final dao = appDatabase.usuarioDao;
  
    // Obtenha o texto dos campos de texto
    final loginText = login.text;
    final senhaText = senha.text;

    // Busque o usuário pelo login e senha
    final usuarios = await dao.getAll();
    for (var usuario in usuarios) {
        // Usuário encontrado, faça algo, como navegar para a próxima tela
       if ((loginText==usuario.login) && (int.parse(senhaText)==usuario.senha)){
           print('senha: ${usuario.senha}, Nome: ${usuario.login}');
          
           return;
           
        }else{
           print("error");
          
        }
          
  
        
      
    }

    // Se não encontrar o usuário, exiba uma mensagem de erro
 
  }
}
