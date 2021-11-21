import 'package:cloud_firestore/cloud_firestore.dart';

class Negocio{
  int id;
  String nombre;
  String direccion;
  GeoPoint geolocalizacion;
  String telefono;
  String celular;
  String pagina_web;
  String logo;
  String foto;
  DocumentReference tipo;

  Negocio({
      required this.id,
      required this.nombre,
      required this.direccion,
      required this.geolocalizacion,
      required this.telefono,
      required this.celular,
      required this.pagina_web,
      required this.logo,
      required this.foto,
      required this.tipo
      });

  Negocio.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as int,
      nombre: json['nombre']! as String,
      direccion: json['direccion']! as String,
      geolocalizacion: json['geolocalizacion']! as GeoPoint,
      telefono: json['telefono']! as String,
      celular: json['celular']! as String,
      pagina_web: json['pagina_web']! as String,
      logo: json['logo']! as String,
      foto: json['foto']! as String,
      tipo: json['tipo']! as DocumentReference
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'direccion': direccion,
      'geolocalizacion': geolocalizacion,
      'telefono': telefono,
      'celular': celular,
      'pagina_web': pagina_web,
      'logo': logo,
      'foto': foto,
      'tipo': tipo,
    };
  }
}