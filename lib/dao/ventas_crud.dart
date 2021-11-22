import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/Exceptions/errores.dart';
import 'package:proyecto_ciclo4b/dao/myhttpwrapper.dart';
import 'package:proyecto_ciclo4b/models/ventas.dart';

class CrudVentas extends MyHttpWrapper<Venta>{
  final objectRef = FirebaseFirestore.instance.collection('ventas').withConverter<Venta>(
    fromFirestore: (snapshot, _) => Venta.fromJson(snapshot.data()!),
    toFirestore: (productos, _) => productos.toJson(),
  );

  CrudVentas();

  @override
  Future<Venta> consultar(int id) async{
    List<QueryDocumentSnapshot<Venta>> ventas = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    if(ventas.isNotEmpty) {
      QueryDocumentSnapshot<Venta> venta = ventas.elementAt(0);
      return venta.data();
    }
    throw EmptyError();
  }

  @override
  Future<DocumentReference> consultarRef(int id) async{
    List<QueryDocumentSnapshot<Venta>> ventas = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    QueryDocumentSnapshot<Venta> venta;
    if(ventas.isNotEmpty) {
      venta = ventas.elementAt(0);
      return venta.reference;
    }
    throw EmptyError();
  }

  @override
  Future<int> consultarUltimo() async{
    List<QueryDocumentSnapshot<Venta>> ventas = await objectRef
        .orderBy("id")
        .limitToLast(1)
        .get()
        .then((snapshot) => snapshot.docs);
    try {
      QueryDocumentSnapshot<Venta> venta = ventas.elementAt(0);
      return venta.data().id;
    }on IndexError catch(_){
      return 0;
    }
  }

  @override
  Future<DocumentReference> crear(Venta objeto) async{
    objeto.id = await consultarUltimo() + 1;
    return await objectRef.add(objeto);
  }

  @override
  Future<void> eliminar(DocumentReference ref) {
    CollectionReference venta = FirebaseFirestore.instance.collection('ventas');
    return venta
        .doc(ref.id)
        .delete();
  }

  @override
  Future<List<Venta>> listar() async{
    List<QueryDocumentSnapshot<Venta>> ventas = await objectRef
        .get()
        .then((snapshot) => snapshot.docs);
    List<Venta> venta = ventas.map((i)=>i.data()).toList();
    return venta;
  }
}