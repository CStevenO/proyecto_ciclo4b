import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';

class NegociosProductos{
  DocumentReference id;
  List<Negocio> negocios;

  NegociosProductos({
    required this.id,
    required this.negocios
  });

  NegociosProductos.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as DocumentReference,
      negocios: (json['negocios']! as List<dynamic>).map((i)=>Negocio.fromJson(i)).toList()
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'negocios': negocios.map((i)=>i.toJson()).toList()
    };
  }

}