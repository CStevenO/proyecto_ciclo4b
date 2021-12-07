import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/components/productos_list_view.dart';
import 'package:proyecto_ciclo4b/components/search_app_bar.dart';
import 'package:proyecto_ciclo4b/dao/producto_negocio_crud.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';

class ProductosScreen extends StatelessWidget{
  String nombre;

  ProductosScreen({
    Key? key,
    required this.nombre
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(prim: false),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                nombre,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            FutureBuilder(
              future: CrudProductoNegocio().listarPorProducto(nombre),
              builder: (context, AsyncSnapshot<List<ProductoNegocio>> snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return ProductosListView(productos: snapshot.data?? []);
                } else{
                  return const CircularProgressIndicator();
                }
              }
            )
          ],
        ),
      ),
    );
  }
}