import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/components/view_negocio.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class NegociosListView extends StatelessWidget{
  final List<Negocio> negocios;

  const NegociosListView({
    Key? key,
    required this.negocios,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: negocios.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 700),
              child: SlideAnimation(
                horizontalOffset: 44.0,
                child: FadeInAnimation(
                  child: ViewNegocio(negocio: negocios[index]),
                ),
              )
          );
        }
      ),
    );
  }
}