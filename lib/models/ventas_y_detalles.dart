import 'package:proyecto_ciclo4b/models/detalle_ventas.dart';
import 'package:proyecto_ciclo4b/models/ventas.dart';
import 'dart:convert';

class VentasyDetalles{
  Venta venta;
  List<DetalleVentas> detalles;

  VentasyDetalles(
      this.venta,
      this.detalles
      );

  VentasyDetalles.fromJson(Map<String, dynamic> json)
      : venta = Venta.fromJson(json['ventas']),
        detalles = json['detalles'].map((i)=>DetalleVentas.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
    'venta': venta.toJson(),
    'detalles': jsonEncode(detalles),
  };
}