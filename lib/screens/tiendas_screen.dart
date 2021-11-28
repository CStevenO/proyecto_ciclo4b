import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/components/circular_tipos.dart';
import 'package:proyecto_ciclo4b/dao/negocio_crud.dart';
import 'package:proyecto_ciclo4b/dao/tipo_negocio_crud.dart';
import 'package:proyecto_ciclo4b/models/tipo_negocio.dart';

class TiendasScreen extends StatelessWidget{
  final TipoNegocio tipo;

  const TiendasScreen({Key? key, required this.tipo}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tipo.tipo,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      //TODO: toca borrar los circulos tipo instagram ya que creo que resultan ser innecesarios, se podria nada mas poner el ListView de las tiendas y ya
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ExploreTiposListView(),
          const SizedBox(height: 16),
          Container(color: Colors.blueGrey),
          //TiendasListView()
        ],
      ),
    );
  }
}

class ExploreTiposListView extends StatelessWidget{
  final tipos = CrudTipoNegocio();

  ExploreTiposListView({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tipos.listar(),
      builder: (context,AsyncSnapshot<List<TipoNegocio>> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return CircularTiposListView(tipos: snapshot.data?? []);
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}