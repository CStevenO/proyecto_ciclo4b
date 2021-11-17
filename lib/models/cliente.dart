class Cliente{
  int id;
  String nombre;
  String direccion;
  String telefono;
  String celular;
  //TODO: Agregar password and User

  Cliente(
      this.id,
      this.nombre,
      this.direccion,
      this.telefono,
      this.celular
      );
  Cliente.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nombre = json['nombre'],
        direccion = json['direccion'],
        telefono = json['telefono'],
        celular = json['celular'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'direccion': direccion,
    'telefono': telefono,
    'celular': celular,
  };
}