import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/Exceptions/errores.dart';
import 'package:proyecto_ciclo4b/dao/myhttpwrapper.dart';
import 'package:proyecto_ciclo4b/models/cliente.dart';

class CrudCliente extends MyHttpWrapper<Cliente>{
  final objectRef = FirebaseFirestore.instance.collection('clientes').withConverter<Cliente>(
    fromFirestore: (snapshot, _) => Cliente.fromJson(snapshot.data()!),
    toFirestore: (productos, _) => productos.toJson(),
  );

  CrudCliente();

  @override
  Future<Cliente> consultar(int id) async{
    List<QueryDocumentSnapshot<Cliente>> clientes = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    if(clientes.isNotEmpty) {
      QueryDocumentSnapshot<Cliente> cliente = clientes.elementAt(0);
      return cliente.data();
    }
    throw EmptyError();
  }

  @override
  Future<int> consultarUltimo() async{
    List<QueryDocumentSnapshot<Cliente>> clientes = await objectRef
        .orderBy("id")
        .limitToLast(1)
        .get()
        .then((snapshot) => snapshot.docs);
    try {
      QueryDocumentSnapshot<Cliente> cliente = clientes.elementAt(0);
      return cliente.data().id;
    }on IndexError catch(_){
      return 0;
    }
  }

  @override
  Future<DocumentReference> crear(Cliente objeto) async{
      objeto.id = await consultarUltimo() + 1;
      return await objectRef.add(objeto);
  }

  @override
  Future<void> eliminar(DocumentReference ref) {
    CollectionReference clientes = FirebaseFirestore.instance.collection('clientes');
    return clientes
        .doc(ref.id)
        .delete();
  }

  @override
  Future<DocumentReference> consultarRef(int id) async{
    List<QueryDocumentSnapshot<Cliente>> clientes = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    QueryDocumentSnapshot<Cliente> cliente;
    if(clientes.isNotEmpty) {
      cliente = clientes.elementAt(0);
      return cliente.reference;
    }
    throw EmptyError();
  }

  @override
  Future<List<Cliente>> listar() async{
    List<QueryDocumentSnapshot<Cliente>> clientes = await objectRef
        .get()
        .then((snapshot) => snapshot.docs);
    List<Cliente> cliente = clientes.map((i)=>i.data()).toList();
    return cliente;
  }
}