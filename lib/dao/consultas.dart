import 'package:proyecto_ciclo4b/dao/myhttpwrapper.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:proyecto_ciclo4b/models/cliente.dart';

class CRUDCliente extends MyHttpWrapper<Cliente>{
  final String endpoint;
  final String api;
  CRUDCliente(this.endpoint,this.api);

  @override
  Future<Cliente> consultar(int id) async{
    var url = Uri.parse(endpoint+api+id.toString());
    var response = await http.get(url);
    Cliente cliente = Cliente(0,"","","","");
    if (response.statusCode == 200) {
      String data = convert.utf8.decode(response.bodyBytes);
      final jsonData = convert.jsonDecode(data);
      cliente = Cliente.fromJson(jsonData);
    }
    return cliente;
  }

  @override
  Future<Cliente> crear(Cliente objeto) async{
    print(convert.jsonEncode(objeto.toJson()));
    var url = Uri.parse(endpoint+api);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: convert.jsonEncode(objeto.toJson()));
    Cliente cliente = Cliente(0,"","","","");
    if (response.statusCode == 200) {
      String data = convert.utf8.decode(response.bodyBytes);
      final jsonData = convert.jsonDecode(data);
      cliente = Cliente.fromJson(jsonData);
    }
    return cliente;
  }

  @override
  Future<String> eliminar(int id) async{
    String data = "";
    var url = Uri.parse(endpoint+api+id.toString());
    var response = await http.delete(url,
        headers: {"Content-Type": "application/text"});
    if (response.statusCode == 200) {
      data = convert.utf8.decode(response.bodyBytes);
    }
    return data;
  }

  @override
  Future<List<Cliente>> listar() async{
    var url = Uri.parse(endpoint+api);
    var response = await http.get(url,
        headers: {"Content-Type": "application/text"});
    List<Cliente> clientes = [];
    if (response.statusCode == 200) {
      String data = convert.utf8.decode(response.bodyBytes);
      final List<dynamic> jsonData = convert.jsonDecode(data);
      clientes = jsonData.map((i)=>Cliente.fromJson(i)).toList();
    }
    return clientes;
  }
}