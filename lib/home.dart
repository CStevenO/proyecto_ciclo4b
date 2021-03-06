import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/components/search_app_bar.dart';
import 'package:proyecto_ciclo4b/dao/cliente_crud.dart';
import 'package:proyecto_ciclo4b/models/cliente.dart';
import 'package:proyecto_ciclo4b/screens/explore_perfil.dart';
import 'package:proyecto_ciclo4b/screens/explore_tipos.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget{
  const Home({Key? key}): super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreTipos(),
    //TODO: agregar ExploreMapa
    Container(color: Colors.green),
    //TODO: agregar ExploreCarrito
    Container(color: Colors.blue),
    FutureBuilder(
      future: CrudCliente().consultar(2),
      builder: (context, AsyncSnapshot<Cliente> snapshot) {
        return ExplorePerfil(cliente: snapshot.data?? Cliente.init());
      },
    ),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: pages[_selectedIndex],
      //TODO: Agregarle animación para cuando se cambie de página
      bottomNavigationBar: BottomNavigationBar(
        //selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
            backgroundColor: Colors.deepPurpleAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_outlined),
            label: 'Mapa',
            backgroundColor: Colors.deepPurpleAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrito de Compras',
            backgroundColor: Colors.deepPurpleAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Perfil',
            backgroundColor: Colors.deepPurpleAccent
          ),
        ],
      ),
    );
  }
}

