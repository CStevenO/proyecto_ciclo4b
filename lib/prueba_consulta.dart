import 'package:http/http.dart' as http;
import 'package:proyecto_ciclo4b/dao/consultas.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';
import 'package:proyecto_ciclo4b/tienda.dart';
import 'dart:convert' as convert;

import 'models/cliente.dart';

class PruebaConsulta {
  Future<List<Tienda>> consultar() async{
    List<Tienda> tienda = [];
    //crea el objeto de consulta crud
    CRUDCliente consultaCliente = CRUDCliente('http://localhost:8080','/clientes/',);
    //consulta un cliente por id 1
    Cliente cliente = await consultaCliente.consultar(1);
    print(cliente.direccion);
    print(cliente.toJson());
    //crea o actualiza un cliente NOTA: para crear se debe dejar el id en 0, para actualizar debe llevar el id correspondiente
    Cliente cliente1 = Cliente(2, "Prueba", "inventada", "1234567", "3123456789");
    cliente = await consultaCliente.crear(cliente1);
    print(cliente.direccion);
    print(cliente.toJson());
    //eliminar un cliente por id
    String confirmacion = await consultaCliente.eliminar(1);
    print(confirmacion);
    //listar clientes
    List<Cliente> clientes = await consultaCliente.listar();
    print(clientes[0].direccion);
    return tienda;
  }
}