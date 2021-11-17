import 'package:http/http.dart' as http;
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';
import 'package:proyecto_ciclo4b/tienda.dart';
import 'dart:convert' as convert;

class PruebaConsulta {
  Future<List<Tienda>> consultar() async{
    List<Tienda> tienda = [];

    var url = Uri.parse('http://192.168.3.156:8080/productoNegocio/1');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = convert.utf8.decode(response.bodyBytes);
      final jsonData = convert.jsonDecode(data);
      ProductoNegocio producto = ProductoNegocio.fromJson(jsonData);
      print(producto.negocio.pagina_web);
      print(producto.toJson());
    }
    return tienda;
  }
}