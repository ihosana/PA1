import 'package:flutter/material.dart';
import 'package:pa1_activy/dataBase/AppDatabase.dart';
import 'package:pa1_activy/model/Usuario.dart';
import 'package:pa1_activy/model/UsuarioBD.dart';
import 'package:pa1_activy/model/UsuarioDao.dart';

class Listar extends StatelessWidget {
  const Listar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Lista de Usuarios'),
          
        ),
        body: FutureBuilder<List<UsuarioBD>>(
          // Recupere a lista de produtos da DAO
          future: _loadUserData(),
          builder: (context, snapshot) {
            // Verifique se há dados
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Se houver dados, exiba-os no ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                UsuarioBD user = snapshot.data![index];
                return ListTile(
                  title: Text(user.nome+"isADM:"+user.isAdm.toString()),
                  subtitle: Text("Senha: "+user.senha.toString()+", CPF:"+user.cpf.toString()),
                  
                  // Adicione outros campos conforme necessário
                );
              },
              
              
            );
          },
          
          
        ),
        
      ),
      
    );
  }

  Future<List<UsuarioBD>> _loadUserData() async {
    // Aqui você precisa usar a classe concreta gerada pelo Floor
    final appDatabase = await $FloorAppDatabase.databaseBuilder('AppDatabase.db').build();
    final dao = appDatabase.usuarioDao;
    //var bd= UsuarioBD(4,"Taniro", 666, "tan", false, 123);
   // dao.insertUsuario(bd);
    return dao.getAll();
  }
}
