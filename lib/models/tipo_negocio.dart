class TipoNegocio{
  int id;
  String tipo;
  String foto;

  TipoNegocio(
      this.id,
      this.tipo,
      this.foto
      );

  TipoNegocio.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        tipo = json['tipo'],
        foto = json['foto'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'tipo': tipo,
    'foto': foto,
  };
}