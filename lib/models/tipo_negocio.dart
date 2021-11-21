class TipoNegocio{
  int id;
  String tipo;
  String foto;

  TipoNegocio({
    required this.id,
    required this.tipo,
    required this.foto
  });

  TipoNegocio.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as int,
      tipo: json['tipo']! as String,
      foto: json['foto']! as String
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'tipo': tipo,
      'foto': foto
    };
  }
}