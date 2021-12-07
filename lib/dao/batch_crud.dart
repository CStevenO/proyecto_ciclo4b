import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclo4b/Exceptions/errores.dart';
import 'package:proyecto_ciclo4b/dao/negocio_crud.dart';
import 'package:proyecto_ciclo4b/dao/producto_crud.dart';
import 'package:proyecto_ciclo4b/dao/producto_negocio_crud.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:proyecto_ciclo4b/models/negocios_productos.dart';
import 'package:proyecto_ciclo4b/models/producto.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';

//al llamar a alguno de estos metodos utilizar try on EmptyError catch(_)
class BatchCrud{
  WriteBatch batch = FirebaseFirestore.instance.batch();
  final objectRef = FirebaseFirestore.instance.collection('negocios_productos').withConverter<NegociosProductos>(
    fromFirestore: (snapshot, _) => NegociosProductos.fromJson(snapshot.data()!),
    toFirestore: (productos, _) => productos.toJson(),
  );

  BatchCrud();
  //TODO: revisar este metodo ya que para actualizar un negocio toca hacerlo en una lista de productos que ofrezca ese negocio
  Future<void> actualizarNegocio(DocumentReference proRef,DocumentReference negRef,Negocio negocio)async{
    QueryDocumentSnapshot<NegociosProductos> document;
    try {
      document = (await objectRef.where(
          'id', isEqualTo: proRef).get().then((snapshot) => snapshot.docs)).first;
    }on IndexError catch(_){
      throw EmptyError;
    }
    int cont = 0;
    NegociosProductos n = document.data();
    for(Negocio ne in document.data().negocios){
      if(ne.id == negocio.id){
        n.negocios.removeAt(cont);
        n.negocios.add(negocio);
        break;
      }
      cont += 1; 
    }
    batch.update(document.reference, n.toJson());
    batch.update(negRef, negocio.toJson());
    batch.commit();
  }

  Future<void> agregarNegocio(DocumentReference proRef,DocumentReference negRef,Negocio negocio)async{
    QueryDocumentSnapshot<NegociosProductos> document;
    try {
      document = (await objectRef.where(
          'id', isEqualTo: proRef).get().then((snapshot) => snapshot.docs)).first;
    }on IndexError catch(_){
      throw EmptyError;
    }
    int cont = 0;
    NegociosProductos n = document.data();
    n.negocios.add(negocio);
    batch.update(document.reference, n.toJson());
    batch.update(negRef, negocio.toJson());
    batch.commit();
  }

  //al crear un producto tambien se tiene que crear un negociosProducto así que el negocio que cree el producto nuevo será el que lo inicie
  //tambien va a crear una referencia entre el producto y el negocio en Producto_negocio
  Future<void> crearProducto(Producto producto,Negocio negocio,double precio) async{
    DocumentReference refpro = await CrudProducto().crear(producto);
    objectRef.add(NegociosProductos(
        id: refpro,
        negocios: [negocio]
    ));
    ProductoNegocio proneg = ProductoNegocio(
        producto: producto,
        negocio: negocio.nombre,
        refNegocio: await CrudNegocio().consultarRef(negocio.id),
        precio: precio,
        refProducto: refpro
    );
    CrudProductoNegocio().crear(proneg);
  }

  Future<void> eliminarNegocioProducto(DocumentReference idPro, int idNeg) async{
    QueryDocumentSnapshot<NegociosProductos> document;
    try {
      document = (await objectRef.where(
          'id', isEqualTo: idPro).get().then((snapshot) => snapshot.docs)).first;
    }on IndexError catch(_){
      throw EmptyError;
    }
    int cont = 0;
    NegociosProductos n = document.data();
    for(Negocio ne in document.data().negocios){
      if(ne.id == idNeg){
        n.negocios.removeAt(cont);
        break;
      }
      cont += 1;
    }
    batch.update(document.reference, n.toJson());
    batch.commit();
  }

  Future<void> agregarProducto(Negocio negocio,Producto producto, double precio) async{

  }
}