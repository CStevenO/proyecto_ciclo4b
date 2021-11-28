import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:proyecto_ciclo4b/models/tipo_negocio.dart';
import 'package:proyecto_ciclo4b/screens/tiendas_screen.dart';

class ViewTipo extends StatelessWidget{
  final TipoNegocio tipo;

  const ViewTipo({
    Key? key,
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (_, closeContainer) => TiendasScreen(tipo: tipo),
      closedBuilder: (_, openContainer) => Item(tipo: tipo),
      openColor: Colors.transparent,
      closedColor: Colors.transparent,
    );
  }
}

class Item extends StatelessWidget{
  final TipoNegocio tipo;

  const Item({
    Key? key,
    required this.tipo
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: Image.asset(
                '${tipo.foto}',
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 5),
          Center(child:Text(
            tipo.tipo,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),),
        ],
      ),
    );
  }
}