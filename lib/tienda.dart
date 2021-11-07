class Tienda {
  String label;
  String imageUrl;
  //TODO: Agregar informacion de las tiendas aqui
  List<TiendaInformation> informations;

  Tienda(
      this.label,
      this.imageUrl,
      this.informations,
  );
  //TODO: Agregar una List<Tienda> aqui
  static List<Tienda> samples = [
    Tienda(
      'Miscelanea',
      'miscelanea.jpg',
      [
        TiendaInformation("Cra Misce", "Miscelanea 1", "2342352"),
        TiendaInformation("Cra Misce 1", "Miscelanea 2", "234432352")
      ],
    ),
    Tienda(
      'Drogueria',
      'drogueria.jpg',
      [
        TiendaInformation("Cra Drog", "Drogueria 1", "234234252"),
        TiendaInformation("Cra Drog 1", "Drogueria 2", "2342342352")
      ],
    ),
    Tienda(
      'Carniceria',
      'carniceria.jpg',
      [
        TiendaInformation("Cra Carn", "Carnice 1", "2342352"),
        TiendaInformation("Cra Carn 1", "Carnice 2", "234432352")
      ],
    ),
    Tienda(
      'Panaderia',
      'panaderia.jpg',
      [
        TiendaInformation("Cra Pana", "Panaderia 1", "2342352"),
        TiendaInformation("Cra Pana 1", "Panaderia 2", "234432352")
      ],
    ),
  ];
}

class TiendaInformation {
  String nombre;
  String direccion;
  String telefono;

  TiendaInformation(
      this.direccion,
      this.nombre,
      this.telefono,
  );
}