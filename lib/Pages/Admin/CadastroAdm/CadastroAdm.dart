import 'package:flutter/material.dart';
import 'package:pa1_activy/Pages/LoginPage/LoginPage.dart';
import 'package:pa1_activy/dataBase/DataBase3.dart'; // Importe o banco de dados aqui
import 'package:pa1_activy/Models/User/UserDB.dart'; // Importe o modelo de usuário aqui

class CadastroAdm extends StatefulWidget {
  @override
  _CadastroScreenStateAdm createState() => _CadastroScreenStateAdm();
}

class _CadastroScreenStateAdm extends State<CadastroAdm> {
  final TextEditingController name = TextEditingController();
  final TextEditingController cpf = TextEditingController();
  final TextEditingController login = TextEditingController();
  bool isAdm = true;
  final TextEditingController password = TextEditingController();

  // Método para salvar o usuário no banco de dados
  void _saveUser() async {
    final appDatabase =
        await $FloorDataBase.databaseBuilder('DataBase3.db').build();
    final dao = appDatabase.usuarioDao;

    var novoUsuario = UserDB(name.text, int.parse(cpf.text), login.text, isAdm,
        int.parse(password.text));
   
    dao.insertUser(novoUsuario);
   print("cadastrou");
     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
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
                             
                          ],
                        ),
                      ),
                      SizedBox(height: 45.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:()=>{},
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





/** SizedBox(height: 45.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveUser,
                child: Text('Cadastrar'),
              ),
            ), 
            
            
            
            
      check
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
            ),      */