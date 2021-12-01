import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:google_fonts/google_fonts.dart';

class TiendaScreen extends StatelessWidget{
  Negocio negocio;

  TiendaScreen({
    Key? key,
    required this.negocio,
  }): super(key: key);
  //TODO: Terminar todo esto pero que se vea bonito
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          negocio.nombre,
          style: GoogleFonts.openSans(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(negocio.foto),
                  fit: BoxFit.cover
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                )
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:  const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                        ),
                        gradient: LinearGradient(
                          end: const Alignment(0.0, 0.4),
                          begin: const Alignment(0.0, -1),
                          colors: <Color>[
                            Colors.black12.withOpacity(0.0),
                            Colors.black87
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                          right: 10
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Material(
                            borderRadius: const BorderRadius.all(Radius.circular(33)),
                            elevation: 10,
                            child: CircleAvatar(
                              radius: 34,
                              backgroundColor: Colors.deepPurple.shade700,
                              child: CircleAvatar(
                                  radius: 33,
                                  backgroundImage: AssetImage(negocio.logo)
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            negocio.nombre,
                            style: GoogleFonts.openSans(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Direccion: ' + negocio.direccion,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Telefono: ' + negocio.telefono,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Celular: ' + negocio.celular,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'latitud: ' + negocio.geolocalizacion.latitude.toString() + ' longitud: ' + negocio.geolocalizacion.longitude.toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Pagina Web: ' + negocio.pagina_web,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }
}