import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/models/tipo_negocio.dart';
import 'package:proyecto_ciclo4b/screens/tiendas_screen.dart';

class CircularTiposListView extends StatelessWidget{
  final List<TipoNegocio> tipos;

  const CircularTiposListView({
    Key? key,
    required this.tipos,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16
      ),
      child: Container(
        height: 150,
        color: Colors.transparent,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: tipos.length,
          itemBuilder: (context,index){
            final tipo = tipos[index];
            return CircularTipos(tipo: tipo);
          },
          separatorBuilder: (context, index){
            return const SizedBox(width: 30);
          },
        ),
      ),
    );
  }
}

class CircularTipos extends StatelessWidget{
  TipoNegocio tipo;

  CircularTipos({
    Key? key,
    required this.tipo,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            radius: 35,
            child: CircleAvatar(
              radius: 35 - 2,
              backgroundImage: AssetImage(tipo.foto),
            ),
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TiendasScreen(tipo: tipo),
              ),
            );
          },
        ),
        const SizedBox(height: 3),
        Center(
          child: Text(
            tipo.tipo,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}