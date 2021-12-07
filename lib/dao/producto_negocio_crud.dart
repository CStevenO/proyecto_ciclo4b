import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/Exceptions/errores.dart';
import 'package:proyecto_ciclo4b/dao/myhttpwrapper.dart';
import 'package:proyecto_ciclo4b/dao/negocio_crud.dart';
import 'package:proyecto_ciclo4b/dao/producto_crud.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:proyecto_ciclo4b/models/producto.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';


class CrudProductoNegocio extends MyHttpWrapper<ProductoNegocio>{
  final objectRef = FirebaseFirestore.instance.collection('productos_negocio').withConverter<ProductoNegocio>(
    fromFirestore: (snapshot, _) => ProductoNegocio.fromJson(snapshot.data()!),
    toFirestore: (productos, _) => productos.toJson(),
  );

  CrudProductoNegocio();

  @override
  Future<ProductoNegocio> consultar(int id) async{
    List<QueryDocumentSnapshot<ProductoNegocio>> productos = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    if(productos.isNotEmpty) {
      QueryDocumentSnapshot<ProductoNegocio> producto = productos.elementAt(0);
      return producto.data();
    }
    throw EmptyError();
  }

  @override
  Future<DocumentReference> consultarRef(int id) async{
    List<QueryDocumentSnapshot<ProductoNegocio>> productos = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    QueryDocumentSnapshot<ProductoNegocio> producto;
    if(productos.isNotEmpty) {
      producto = productos.elementAt(0);
      return producto.reference;
    }
    throw EmptyError();
  }

  @override
  Future<int> consultarUltimo() async{
    List<QueryDocumentSnapshot<ProductoNegocio>> productos = await objectRef
        .orderBy("id")
        .limitToLast(1)
        .get()
        .then((snapshot) => snapshot.docs);
    try {
      QueryDocumentSnapshot<ProductoNegocio> producto = productos.elementAt(0);
      return producto.data().id;
    }on IndexError catch(_){
      return 0;
    }
  }

  @override
  Future<DocumentReference> crear(ProductoNegocio objeto) async{
    objeto.id = await consultarUltimo() + 1;
    return await objectRef.add(objeto);
  }

  @override
  Future<void> eliminar(DocumentReference ref) {
    CollectionReference producto = FirebaseFirestore.instance.collection('productos_negocio');
    return producto
        .doc(ref.id)
        .delete();
  }

  @override
  Future<List<ProductoNegocio>> listar() async{
    List<QueryDocumentSnapshot<ProductoNegocio>> productos = await objectRef
        .get()
        .then((snapshot) => snapshot.docs);
    List<ProductoNegocio> producto = productos.map((i)=>i.data()).toList();
    return producto;
  }

  Future<List<ProductoNegocio>> listarPorNegocio(Negocio negocio) async{
    List<QueryDocumentSnapshot<ProductoNegocio>> productos = await objectRef
        .where('refNegocio', isEqualTo: await CrudNegocio().consultarRef(negocio.id))
        .get()
        .then((snapshot) => snapshot.docs);
    List<ProductoNegocio> producto = productos.map((i) => i.data()).toList();
    return producto;
  }

  Future<List<ProductoNegocio>> listarPorProducto(String nombre) async{
    List<QueryDocumentSnapshot<ProductoNegocio>> productos = await objectRef
        .where('refProducto', isEqualTo: await CrudProducto().consultarPorNombre(nombre))
        .get()
        .then((snapshot) => snapshot.docs);
    List<ProductoNegocio> producto = productos.map((i) => i.data()).toList();
    return producto;
  }
}