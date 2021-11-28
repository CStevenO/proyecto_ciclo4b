import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/dao/tipo_negocio_crud.dart';
import 'package:proyecto_ciclo4b/models/tipo_negocio.dart';
import 'package:proyecto_ciclo4b/screens/tipos_screen.dart';

class ExploreTipos extends StatelessWidget{
  final tiposSer = CrudTipoNegocio();

  ExploreTipos({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tiposSer.listar(),
      builder: (context,AsyncSnapshot<List<TipoNegocio>> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return TipoScreen(tipos: snapshot.data ?? []);
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}