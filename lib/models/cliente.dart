class Cliente{
  int id = 0;
  String nombre = "";
  String direccion = "";
  String telefono = "";
  String celular = "";
  String user = "";
  String password = "";
  //TODO: Agregar password and User

  Cliente({
    this.id = 0,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.celular,
    required this.user,
    required this.password,
  });

  Cliente.init();

  Cliente.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as int,
      nombre: json['nombre']! as String,
      direccion: json['direccion']! as String,
      telefono: json['telefono']! as String,
      celular: json['celular']! as String,
      user: json['user']! as String,
      password: json['password'] as String,
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'direccion': direccion,
      'telefono': telefono,
      'celular': celular,
      'user': user,
      'password': password,
    };
  }
}