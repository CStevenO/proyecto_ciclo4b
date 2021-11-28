import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/tiendita_theme.dart';

import 'home.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = TienditaTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'Tiendita',
      home: Home(),
    );
  }
}
