class Negocio{
  int id;
  String nombre;
  String direccion;
  String geolocalizacion;
  String telefono;
  String celular;
  String pagina_web;
  String logo;
  String foto;

  Negocio(
      this.id,
      this.nombre,
      this.direccion,
      this.geolocalizacion,
      this.telefono,
      this.celular,
      this.pagina_web,
      this.logo,
      this.foto,
      );
  Negocio.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nombre = json['nombre'],
        direccion = json['direccion'],
        geolocalizacion = json['geolocalizacion'],
        telefono = json['telefono'],
        celular = json['celular'],
        pagina_web = json['pagina_web'],
        logo = json['logo'],
        foto = json['foto'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'direccion': direccion,
    'geolocalizacion': geolocalizacion,
    'telefono': telefono,
    'celular': celular,
    'pagina_web': pagina_web,
    'logo': logo,
    'foto': foto,
  };
}