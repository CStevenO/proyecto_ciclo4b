import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/prueba_consulta.dart';
import 'package:proyecto_ciclo4b/tienda.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  late Future<List<Tienda>> datos;
  @override
  void initState(){
    datos = PruebaConsulta().consultar();
    super.initState();
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
