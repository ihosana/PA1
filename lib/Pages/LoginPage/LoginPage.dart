
import 'package:flutter/material.dart';
import 'package:pa1_activy/Listar.dart';
import 'package:pa1_activy/Pages/CadastroPage/CadastroPage.dart';
import 'package:pa1_activy/Pages/RoutingPage.dart';
import 'package:pa1_activy/dataBase/DataBase.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController password = TextEditingController();
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
                              controller: password,
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
                       ElevatedButton(
                        onPressed: () => 
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CadastroPage()),
                          ),
                        child: Text('Cadastrar'),
                      ),
                       ElevatedButton(
                        onPressed: () => 
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Listar()),
                          ),
                        child: Text('lista'),
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
    final appDatabase = await $FloorDataBase.databaseBuilder('DataBase.db').build();
    final dao = appDatabase.usuarioDao;
  
    // Obtenha o texto dos campos de texto
    final loginText = login.text;
    final passwordText = password.text;

    // Busque o usuário pelo login e senha
    final usuarios = await dao.getAll();
    for (var i in usuarios) {
        // Usuário encontrado, faça algo, como navegar para a próxima tela
       if ((loginText==i.login) && (int.parse(passwordText)==i.password) && (i.isAdm==false)){
           print('senha: ${i.password}, Nome: ${i.login}');
            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RoutingPage()),
                          );
           return;
           
        }else{
           print("error");
          
        }
          
  
        
      
    }

    // Se não encontrar o usuário, exiba uma mensagem de erro
 
  }
}
