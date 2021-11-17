class Producto{
  int id;
  String codigo;
  String nombre;
  String foto;
  Producto(
      this.id,
      this.codigo,
      this.nombre,
      this.foto,
  );

  Producto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        codigo = json['codigo'],
        nombre = json['nombre'],
        foto = json['foto'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'codigo': codigo,
    'nombre': nombre,
    'foto': foto,
  };
}