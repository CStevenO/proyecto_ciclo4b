import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/Exceptions/errores.dart';
import 'package:proyecto_ciclo4b/dao/myhttpwrapper.dart';
import 'package:proyecto_ciclo4b/models/producto.dart';

class CrudProducto extends MyHttpWrapper<Producto>{
  final objectRef = FirebaseFirestore.instance.collection('productos').withConverter<Producto>(
    fromFirestore: (snapshot, _) => Producto.fromJson(snapshot.data()!),
    toFirestore: (productos, _) => productos.toJson(),
  );

  CrudProducto();

  @override
  Future<Producto> consultar(int id) async{
    List<QueryDocumentSnapshot<Producto>> productos = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    if(productos.isNotEmpty) {
      QueryDocumentSnapshot<Producto> producto = productos.elementAt(0);
      return producto.data();
    }
    throw EmptyError();
  }

  @override
  Future<DocumentReference> consultarRef(int id) async{
    List<QueryDocumentSnapshot<Producto>> productos = await objectRef
        .where('id', isEqualTo: id)
        .get()
        .then((snapshot) => snapshot.docs);
    QueryDocumentSnapshot<Producto> producto;
    if(productos.isNotEmpty) {
      producto = productos.elementAt(0);
      return producto.reference;
    }
    throw EmptyError();
  }

  @override
  Future<int> consultarUltimo() async{
    List<QueryDocumentSnapshot<Producto>> productos = await objectRef
        .orderBy("id")
        .limitToLast(1)
        .get()
        .then((snapshot) => snapshot.docs);
    try {
      QueryDocumentSnapshot<Producto> producto = productos.elementAt(0);
      return producto.data().id;
    }on IndexError catch(_){
      return 0;
    }
  }

  @override
  Future<DocumentReference> crear(Producto objeto) async{
    objeto.id = await consultarUltimo() + 1;
    return await objectRef.add(objeto);
  }

  @override
  Future<void> eliminar(DocumentReference ref) {
    CollectionReference producto = FirebaseFirestore.instance.collection('productos');
    return producto
        .doc(ref.id)
        .delete();
  }

  @override
  Future<List<Producto>> listar() async{
    List<QueryDocumentSnapshot<Producto>> productos = await objectRef
        .get()
        .then((snapshot) => snapshot.docs);
    List<Producto> producto = productos.map((i)=>i.data()).toList();
    return producto;
  }

  Future<DocumentReference> consultarPorNombre(String nombre) async{
    List<QueryDocumentSnapshot<Producto>> productos = await objectRef
        .orderBy("nombre")
        .startAt([nombre])
        .endAt([nombre + "\uf8ff"])
        .get()
        .then((snapshot) => snapshot.docs);
    if(productos.isNotEmpty) {
      QueryDocumentSnapshot<Producto> producto = productos.elementAt(0);
      return producto.reference;
    }
    throw EmptyError();
  }
}