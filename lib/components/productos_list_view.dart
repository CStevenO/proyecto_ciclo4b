import 'package:flutter/cupertino.dart';
import 'package:proyecto_ciclo4b/components/view_producto.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductosListView extends StatelessWidget{
  List<ProductoNegocio> productos;

  ProductosListView({
    Key? key,
    required this.productos
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: productos.length,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 700),
            child: SlideAnimation(
              horizontalOffset: 44.0,
              child: FadeInAnimation(
                child: ViewProducto(producto: productos[index]),
              ),
            )
          );
        }
      ),
    );
  }
}