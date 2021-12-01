import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/Exceptions/errores.dart';
import 'package:proyecto_ciclo4b/dao/myhttpwrapper.dart';
import 'package:proyecto_ciclo4b/dao/tipo_negocio_crud.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';

class CrudNegocio extends MyHttpWrapper<Negocio>{
  final objectRef = FirebaseFirestore.instance.collection('negocio').withConverter<Negocio>(
    fromFirestore: (snapshot, _) => Negocio.fromJson(snapshot.data()!),
    toFirestore: (productos, _) => productos.toJson(),
  );

  CrudNegocio();

  @override
  Future<Negocio> consultar(int id) async{
    List<QueryDocumentSnapshot<Negocio>> negocios = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    if(negocios.isNotEmpty) {
      QueryDocumentSnapshot<Negocio> negocio = negocios.elementAt(0);
      return negocio.data();
    }
    throw EmptyError();
  }

  @override
  Future<DocumentReference> consultarRef(int id) async{
    List<QueryDocumentSnapshot<Negocio>> negocios = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    QueryDocumentSnapshot<Negocio> negocio;
    if(negocios.isNotEmpty) {
      negocio = negocios.elementAt(0);
      return negocio.reference;
    }
    throw EmptyError();
  }

  @override
  Future<int> consultarUltimo() async{
    List<QueryDocumentSnapshot<Negocio>> negocios = await objectRef
        .orderBy("id")
        .limitToLast(1)
        .get()
        .then((snapshot) => snapshot.docs);
    try {
      QueryDocumentSnapshot<Negocio> negocio = negocios.elementAt(0);
      return negocio.data().id;
    }on IndexError catch(_){
      return 0;
    }
  }

  @override
  Future<DocumentReference> crear(Negocio objeto) async{
    objeto.id = await consultarUltimo() + 1;
    return await objectRef.add(objeto);
  }

  @override
  Future<void> eliminar(DocumentReference ref) {
    CollectionReference negocios = FirebaseFirestore.instance.collection('negocio');
    return negocios
        .doc(ref.id)
        .delete();
  }

  @override
  Future<List<Negocio>> listar() async{
    List<QueryDocumentSnapshot<Negocio>> negocios = await objectRef
        .get()
        .then((snapshot) => snapshot.docs);
    List<Negocio> negocio = negocios.map((i)=>i.data()).toList();
    return negocio;
  }

  Future<List<Negocio>> buscarPorTipo(int refTipo) async {
    List<QueryDocumentSnapshot<Negocio>> negocios = await objectRef
        .where("tipo", isEqualTo: await CrudTipoNegocio().consultarRef(refTipo))
        .get()
        .then((snapshot) => snapshot.docs);
    List<Negocio> negocio = negocios.map((i) => i.data()).toList();
    return negocio;
  }
}