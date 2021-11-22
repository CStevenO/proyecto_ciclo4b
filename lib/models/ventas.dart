import 'package:cloud_firestore/cloud_firestore.dart';


class Venta{
  int id;
  DocumentReference cliente;
  double total;

  Venta({this.id = 0, required this.cliente, required this.total});

  Venta.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as int,
      cliente: json['cliente']! as DocumentReference,
      total: json['total']! as double
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'cliente': cliente,
      'total': total,
    };
  }
}