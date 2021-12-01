import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/components/view_tipo.dart';
import 'package:proyecto_ciclo4b/models/tipo_negocio.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TipoScreen extends StatelessWidget{
  final List<TipoNegocio> tipos;

  const TipoScreen({
    Key? key,
    required this.tipos,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimationLimiter(
        child: GridView.builder(
          itemCount: tipos.length,
          gridDelegate: const
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index){
            return AnimationConfiguration.staggeredGrid(
                position: index, 
                duration: const Duration(seconds: 1),
                columnCount: 1,
                child: SlideAnimation(
                  verticalOffset: 44.0,
                  child: FadeInAnimation(
                    child: ViewTipo(tipo: tipos[index]),
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
}