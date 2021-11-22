import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/dao/batch_crud.dart';
import 'package:proyecto_ciclo4b/dao/negocio_crud.dart';
import 'package:proyecto_ciclo4b/dao/producto_crud.dart';
import 'package:proyecto_ciclo4b/tienda.dart';

import 'models/producto.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  late Future<List<Tienda>> datos;
  @override
  void initState(){
    //datos = PruebaConsulta().consultar();
    getUsers();
    super.initState();
  }

  void getUsers() async{
    CrudProducto pro = CrudProducto();
    CrudNegocio neg = CrudNegocio();
    Producto producto = Producto(codigo: "1234", nombre: "Leche", foto: "leche.jpg");
    BatchCrud batchCrud = BatchCrud();

    //batchCrud.eliminarNegocioProducto(await pro.consultarRef(3), (await neg.consultar(2)).id);
    //batchCrud.crearNegocio(await pro.consultarRef(3), await neg.consultarRef(2), await neg.consultar(2));

  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Prueba',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prueba 2'),
        ),
      ),
    );
  }
}
