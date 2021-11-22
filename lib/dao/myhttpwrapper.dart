import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MyHttpWrapper<T>{
  //al usar el metodo consultar con cualquier objeto T, lo mejor es usar try/on EmptyError catch(e) para cuando no existe
  Future<T> consultar(int id);
  Future<int> consultarUltimo();
  Future<DocumentReference> crear(T objeto);
  Future<void> eliminar(DocumentReference ref);
  //al igual que consultar lo mejor es usar exceptions ya que la referencia puede que no exista
  Future<DocumentReference> consultarRef(int id);
  Future<List<T>> listar();
}

