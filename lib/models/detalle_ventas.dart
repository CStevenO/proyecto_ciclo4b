import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DetalleVentas{
  DocumentReference id;
  List<Items> items;

  DetalleVentas({
    required this.id,
    required this.items
  });

  DetalleVentas.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as DocumentReference,
      items: (json['items']! as List<dynamic>).map((i)=>Items.fromJson(i)).toList()
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'items': jsonEncode(items)
    };
  }

}

class Items{
  int cantidad;
  DocumentReference producto;

  Items({
    required this.cantidad,
    required this.producto,
  });

  Items.fromJson(Map<String, Object?> json)
      : this(
      cantidad: json['cantidad']! as int,
      producto: json['producto_negocio']! as DocumentReference
  );


  Map<String, Object?> toJson() {
    return {
      'cantidad': cantidad,
      'producto_negocio': producto
    };
  }
}