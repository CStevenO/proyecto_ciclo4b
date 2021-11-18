import 'package:http/http.dart' as http;

enum MyHttpMethod{
  get,
  post,
  delete,
}

abstract class MyHttpWrapper<T>{
  Future<T> consultar(int id);
  Future<T> crear(T objeto);
  Future<String> eliminar(int id);
  Future<List<T>> listar();
}