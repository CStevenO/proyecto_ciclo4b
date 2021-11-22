class Producto{
  int id;
  String codigo;
  String nombre;
  String foto;
  Producto({
    this.id = 0,
    required this.codigo,
    required this.nombre,
    required this.foto,
  });

  Producto.fromJson(Map<String, Object?> json)
      : this(
        id: json['id']! as int,
        codigo: json['codigo']! as String,
        nombre: json['nombre']! as String,
        foto: json['foto']! as String
      );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'codigo': codigo,
      'nombre': nombre,
      'foto': foto
    };
  }
}