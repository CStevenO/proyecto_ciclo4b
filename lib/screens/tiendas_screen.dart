import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/components/negocios_list_view.dart';
import 'package:proyecto_ciclo4b/dao/negocio_crud.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:proyecto_ciclo4b/models/tipo_negocio.dart';
import 'package:google_fonts/google_fonts.dart';

class TiendasScreen extends StatelessWidget{
  final TipoNegocio tipo;

  const TiendasScreen({Key? key, required this.tipo}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tipo.tipo,
          style: GoogleFonts.openSans(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ExploreNegociosListView(tipo_id: tipo.id),
      ),
    );
  }
}

class ExploreNegociosListView extends StatelessWidget{
  final negocios = CrudNegocio();
  final int tipo_id;

  ExploreNegociosListView({
    Key? key,
    required this.tipo_id,
  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: negocios.buscarPorTipo(tipo_id),
      builder: (context,AsyncSnapshot<List<Negocio>> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return NegociosListView(negocios: snapshot.data??[]);
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}