import 'package:cloud_firestore/cloud_firestore.dart';

class ProductoNegocio{
  int id;
  DocumentReference producto;
  DocumentReference negocio;
  double precio;

  ProductoNegocio({
    required this.id,
    required this.producto,
    required this.negocio,
    required this.precio
  });


  ProductoNegocio.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as int,
      producto: json['negocio']! as DocumentReference,
      negocio: json['producto']! as DocumentReference,
      precio: json['precio']! as double
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'producto': producto,
      'negocio': negocio,
      'precio': precio
    };
  }

}