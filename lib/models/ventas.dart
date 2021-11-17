import 'cliente.dart';

class Venta{
  int id;
  Cliente cliente;
  double total;

  Venta(
      this.id,
      this.cliente,
      this.total
      );

  Venta.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        cliente = Cliente.fromJson(json['cliente']),
        total = json['total'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'cliente': cliente.toJson(),
    'total': total,
  };
}