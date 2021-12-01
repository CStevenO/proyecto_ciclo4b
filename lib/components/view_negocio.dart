import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:proyecto_ciclo4b/screens/tienda_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewNegocio extends StatelessWidget{
  Negocio negocio;

  ViewNegocio({
    Key? key,
    required this.negocio,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (_, closeContainer) => TiendaScreen(negocio: negocio),
      closedBuilder: (_, openContainer) => ItemNegocio(negocio: negocio),
      openColor: Colors.transparent,
      closedColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

class ItemNegocio extends StatelessWidget{
  final Negocio negocio;

  const ItemNegocio({
    Key? key,
    required this.negocio,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16)
            ),
            child: Container(
              child: Align(
                alignment: Alignment.center,
                widthFactor: 1,
                heightFactor: 0.4,
                child: Image(
                  image: AssetImage(negocio.logo),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  negocio.nombre,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const Divider(
                  indent: 5,
                  endIndent: 5,
                ),
                Text(
                  'Dirección: ' + negocio.direccion,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 3),
                Text(
                  'Telefono: ' + negocio.telefono,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 3),
                Text(
                  'Página Web: ' + negocio.pagina_web,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const Divider(
                  indent: 5,
                  endIndent: 5,
                ),
                Center(
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.watch_later_outlined,color: Colors.deepPurple),
                      const SizedBox(width: 3),
                      Text(
                        '9:00am-8:00pm',
                        style: GoogleFonts.openSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.location_on_outlined,color: Colors.deepPurple),
                      const SizedBox(width: 3),
                      Text(
                        'latitud: ' + negocio.geolocalizacion.latitude.toString() + '\nlongitud: ' + negocio.geolocalizacion.longitude.toString(),
                        maxLines: 2,
                        style: GoogleFonts.openSans(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}