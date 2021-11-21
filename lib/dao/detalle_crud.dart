import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/Exceptions/errores.dart';
import 'package:proyecto_ciclo4b/dao/myhttpwrapper.dart';
import 'package:proyecto_ciclo4b/models/detalle_ventas.dart';

class CrudDetalle extends MyHttpWrapper<DetalleVentas>{
  final objectRef = FirebaseFirestore.instance.collection('detalle_ventas').withConverter<DetalleVentas>(
    fromFirestore: (snapshot, _) => DetalleVentas.fromJson(snapshot.data()!),
    toFirestore: (productos, _) => productos.toJson(),
  );

  CrudDetalle();

  //el id de entrada es el id de la venta
  @override
  Future<DetalleVentas> consultar(int id) async{
    DocumentReference id2 = await consultarRef(id);
    List<QueryDocumentSnapshot<DetalleVentas>> detalles = await objectRef
        .where('id', isEqualTo: id2)
        .get()
        .then((snapshot) => snapshot.docs);
    if(detalles.isNotEmpty) {
      QueryDocumentSnapshot<DetalleVentas> detalle = detalles.elementAt(0);
      return detalle.data();
    }
    throw EmptyError();
  }
  //este es el id de la venta, pero en este caso devuelve la referencia del documento detalle ventas
  @override
  Future<DocumentReference<Object?>> consultarRef(int id) async{
    DocumentReference id2 = await consultarRef(id);
    List<QueryDocumentSnapshot<DetalleVentas>> detalles = await objectRef
        .where('id', isEqualTo: id2)
        .get()
        .then((snapshot) => snapshot.docs);
    QueryDocumentSnapshot<DetalleVentas> detalle;
    if(detalles.isNotEmpty) {
      detalle = detalles.elementAt(0);
      return detalle.reference;
    }
    throw EmptyError();
  }
  //este metodo no es necesario para detalle ventas ya que el id es una referencia al documento venta
  @override
  Future<int> consultarUltimo() async{
    throw UnimplementedError();
  }

  @override
  Future<DocumentReference> crear(DetalleVentas objeto) async{
    return await objectRef.add(objeto);
  }

  @override
  Future<void> eliminar(DocumentReference ref) {
    CollectionReference detalle = FirebaseFirestore.instance.collection('detalle_ventas');
    return detalle
        .doc(ref.id)
        .delete();
  }

  @override
  Future<List<DetalleVentas>> listar() async{
    List<QueryDocumentSnapshot<DetalleVentas>> detalles = await objectRef
        .get()
        .then((snapshot) => snapshot.docs);
    List<DetalleVentas> detalle = detalles.map((i)=>i.data()).toList();
    return detalle;
  }
}