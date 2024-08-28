import 'package:flutter/material.dart';
import 'package:pa1_activy/Models/Sale/SaleDB.dart';
import 'package:pa1_activy/dataBase/DataBaseFinal1.dart';

class ListarSale extends StatelessWidget {
  const ListarSale({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Lista de Usuarios'),

        ),
        body: FutureBuilder<List<SaleDB>>(
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
                SaleDB prod = snapshot.data![index];
                return ListTile(
                  title: Text(prod.user.toString()+", Data :"+prod.dataVenda),

                  // Adicione outros campos conforme necessário
                );
              },


            );
          },


        ),

      ),

    );
  }

  Future<List<SaleDB>> _loadUserData() async {
    // Aqui você precisa usar a classe concreta gerada pelo Floor
    final appDatabase = await $FloorDataBase.databaseBuilder('DataBaseFinal1.db').build();
    final dao = appDatabase.saleDao;
    
    //var bd= UsuarioBD(4,"Taniro", 666, "tan", false, 123);
    // dao.insertUsuario(bd);
    return dao.getAll();
  }
}
