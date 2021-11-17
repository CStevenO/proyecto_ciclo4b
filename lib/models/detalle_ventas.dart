import 'package:proyecto_ciclo4b/models/producto_negocio.dart';
import 'package:proyecto_ciclo4b/models/ventas.dart';

class DetalleVentas{
  int id;
  Venta venta;
  ProductoNegocio producto;
  int cantidad;

  DetalleVentas(
      this.id,
      this.venta,
      this.producto,
      this.cantidad
      );

  DetalleVentas.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        venta = Venta.fromJson(json['venta']),
        producto = ProductoNegocio.fromJson(json['producto']),
        cantidad = json['cantidad'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'venta': venta.toJson(),
    'producto': producto.toJson(),
    'cantidad': cantidad,
  };
}