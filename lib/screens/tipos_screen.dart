import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/components/view_tipo.dart';
import 'package:proyecto_ciclo4b/models/tipo_negocio.dart';

class TipoScreen extends StatelessWidget{
  final List<TipoNegocio> tipos;

  const TipoScreen({
    Key? key,
    required this.tipos,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: GridView.builder(
        itemCount: tipos.length,
        gridDelegate: const
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index){
          final simpleTipo = tipos[index];
          return ViewTipo(tipo: simpleTipo);
        },
      ),
    );
  }
}