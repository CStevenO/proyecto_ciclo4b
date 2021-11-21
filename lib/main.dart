import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/dao/cliente_crud.dart';
import 'package:proyecto_ciclo4b/dao/myhttpwrapper.dart';
import 'package:proyecto_ciclo4b/models/detalle_ventas.dart';
import 'package:proyecto_ciclo4b/tienda.dart';
import 'dart:convert' as convert;

import 'Exceptions/errores.dart';
import 'models/cliente.dart';
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
    /*CollectionReference collectionReference = FirebaseFirestore.instance.collection("detalle_ventas");
    QuerySnapshot users = await collectionReference.get();
    for(var doc in users.docs){
      print(doc.get("items"));
      List<dynamic> its = doc.get("items");
      List<Items> it = (its).map((i)=>Items.fromJson(i)).toList();
      print(it);
    }*/
    /*
    final productosRef = FirebaseFirestore.instance.collection('detalle_ventas').withConverter<DetalleVentas>(
      fromFirestore: (snapshot, _) => DetalleVentas.fromJson(snapshot.data()!),
      toFirestore: (productos, _) => productos.toJson(),
    );
    List<QueryDocumentSnapshot<DetalleVentas>> productos = await productosRef
        .orderBy("items")
        .get()
        .then((snapshot) => snapshot.docs);
    for(QueryDocumentSnapshot<DetalleVentas> pro in productos){
      print(pro.data().items[0].producto);
    }
    */
    CrudCliente client = CrudCliente();
    /*
    Cliente cliente = Cliente(nombre: "das", direccion: "ew", telefono: "1321", celular: "213231", user: "3123", password: "3123");
    await client.crear(cliente);

    try {
      DocumentReference ref = await client.consultarRef(3);
      client.eliminar(ref);
    }on EmptyError catch(e){
      print(e.errMsg());
    }
    */
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
