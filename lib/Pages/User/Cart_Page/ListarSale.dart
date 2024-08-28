import 'package:flutter/material.dart';
import 'package:pa1_activy/Models/ProductSaleDao/ProductSaleDB.dart';
//import 'package:pa1_activy/Models/ProductSaleDao/ProductSaleDB.dart';
import 'package:pa1_activy/dataBase/DataBaseFinal2.dart';

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
        body: FutureBuilder<List<ProductSaleDB>>(
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
                ProductSaleDB prod = snapshot.data![index];
                return ListTile(
                  title: Text("qtd:"+prod.quantity.toString()+", subtotal :"+prod.subTotal.toString() + ", vendaID:${prod.sale_id}"),
                );
              },


            );
          },


        ),

      ),

    );
  }

  Future<List<ProductSaleDB>> _loadUserData() async {
    // Aqui você precisa usar a classe concreta gerada pelo Floor
    final appDatabase = await $FloorDataBase.databaseBuilder('DataBaseFinal2.db').build();
    final dao = appDatabase.productSaleDao;
    
    //var bd= UsuarioBD(4,"Taniro", 666, "tan", false, 123);
    // dao.insertUsuario(bd);
    return dao.getAll();
  }
}
