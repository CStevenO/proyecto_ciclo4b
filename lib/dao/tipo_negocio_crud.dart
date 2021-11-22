import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/Exceptions/errores.dart';
import 'package:proyecto_ciclo4b/dao/myhttpwrapper.dart';
import 'package:proyecto_ciclo4b/models/tipo_negocio.dart';

class CrudTipoNegocio extends MyHttpWrapper<TipoNegocio>{
  final objectRef = FirebaseFirestore.instance.collection('tipo_negocio').withConverter<TipoNegocio>(
    fromFirestore: (snapshot, _) => TipoNegocio.fromJson(snapshot.data()!),
    toFirestore: (productos, _) => productos.toJson(),
  );

  CrudTipoNegocio();

  @override
  Future<TipoNegocio> consultar(int id) async{
    List<QueryDocumentSnapshot<TipoNegocio>> tipos = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    if(tipos.isNotEmpty) {
      QueryDocumentSnapshot<TipoNegocio> tipo = tipos.elementAt(0);
      return tipo.data();
    }
    throw EmptyError();
  }

  @override
  Future<DocumentReference> consultarRef(int id) async{
    List<QueryDocumentSnapshot<TipoNegocio>> tipos = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    QueryDocumentSnapshot<TipoNegocio> tipo;
    if(tipos.isNotEmpty) {
      tipo = tipos.elementAt(0);
      return tipo.reference;
    }
    throw EmptyError();
  }

  @override
  Future<int> consultarUltimo() async{
    List<QueryDocumentSnapshot<TipoNegocio>> tipos = await objectRef
        .orderBy("id")
        .limitToLast(1)
        .get()
        .then((snapshot) => snapshot.docs);
    try {
      QueryDocumentSnapshot<TipoNegocio> tipo = tipos.elementAt(0);
      return tipo.data().id;
    }on IndexError catch(_){
      return 0;
    }
  }

  @override
  Future<DocumentReference> crear(TipoNegocio objeto) async{
    objeto.id = await consultarUltimo() + 1;
    return await objectRef.add(objeto);
  }

  @override
  Future<void> eliminar(DocumentReference ref) {
    CollectionReference tipo = FirebaseFirestore.instance.collection('tipo_negocio');
    return tipo
        .doc(ref.id)
        .delete();
  }

  @override
  Future<List<TipoNegocio>> listar() async{
    List<QueryDocumentSnapshot<TipoNegocio>> tipos = await objectRef
        .get()
        .then((snapshot) => snapshot.docs);
    List<TipoNegocio> tipo = tipos.map((i)=>i.data()).toList();
    return tipo;
  }
}