import 'prueba_consulta.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';

class Tienda {
  String label;
  String imageUrl;
  //TODO: Agregar informacion de las tiendas aqui
  Negocio informations;

  Tienda(
      this.label,
      this.imageUrl,
      this.informations,
  );
  //TODO: Agregar una List<Tienda> aqui

  static List<Tienda> samples = PruebaConsulta().consultar() as List<Tienda>;
}
