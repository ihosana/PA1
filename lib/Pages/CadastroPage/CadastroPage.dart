import 'package:flutter/material.dart';
import 'package:pa1_activy/Pages/LoginPage/LoginPage.dart';
import 'package:pa1_activy/dataBase/DataBase.dart';
import 'package:pa1_activy/Model/User/UserDB.dart';

class CadastroPage extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController cpf = TextEditingController();
  final TextEditingController login = TextEditingController();
  bool isAdm = false;
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
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
                              controller: name,
                              decoration: InputDecoration(
                                labelText: 'Nome',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: cpf,
                              decoration: InputDecoration(
                                labelText: 'CPF',
                                prefixIcon: Icon(Icons.credit_card),
                              ),
                            ),
                            SizedBox(height: 20),
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
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                  value: isAdm,
                                  onChanged: (value) {
                                    isAdm = value!;
                                  },
                                ),
                                Text('Administrador'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => _saveUser(context),
                        child: Text('Cadastrar'),
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

  void _saveUser(BuildContext context) async {
    final appDatabase = await $FloorDataBase.databaseBuilder('DataBase.db').build();
    final dao = appDatabase.usuarioDao;

    var novoUsuario = UserDB(
      name.text,
      int.parse(cpf.text),
      login.text,
      isAdm,
      int.parse(password.text),
    );

    await dao.insertUser(novoUsuario);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
