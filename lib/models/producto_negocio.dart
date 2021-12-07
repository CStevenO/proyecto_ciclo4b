import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/models/producto.dart';

class ProductoNegocio{
  int id;
  String negocio;
  Producto producto;
  DocumentReference refNegocio;
  DocumentReference refProducto;
  double precio;

  ProductoNegocio({
    this.id = 0,
    required this.producto,
    required this.negocio,
    required this.precio,
    required this.refNegocio,
    required this.refProducto
  });


  ProductoNegocio.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as int,
      producto: Producto.fromJson(json['producto']! as Map<String, Object?>),
      negocio: json['negocio']! as String,
      precio: json['precio']! as double,
      refNegocio: json['refNegocio']! as DocumentReference,
      refProducto: json['refProducto']! as DocumentReference
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'producto': producto.toJson(),
      'negocio': negocio,
      'precio': precio,
      'refNegocio': refNegocio,
      'refProducto': refProducto
    };
  }
}
