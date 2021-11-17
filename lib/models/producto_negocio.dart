import 'package:proyecto_ciclo4b/models/producto.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';

class ProductoNegocio{
  int id;
  Producto producto;
  Negocio negocio;
  double precio;

  ProductoNegocio(
      this.id,
      this.producto,
      this.negocio,
      this.precio
      );

  ProductoNegocio.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        producto = Producto.fromJson(json['producto']),
        negocio = Negocio.fromJson(json['negocio']),
        precio = json['precio'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'producto': producto.toJson(),
    'negocio': negocio.toJson(),
    'precio': precio,
  };
}