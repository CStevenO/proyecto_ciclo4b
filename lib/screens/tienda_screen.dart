import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/components/productos_list_view.dart';
import 'package:proyecto_ciclo4b/dao/producto_negocio_crud.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';

class TiendaScreen extends StatefulWidget{
  Negocio negocio;

  TiendaScreen({
    Key? key,
    required this.negocio,
  }): super(key: key);

  @override
  State<TiendaScreen> createState() => _TiendaScreenState();
}

class _TiendaScreenState extends State<TiendaScreen>{
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.negocio.nombre,
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
                  image: AssetImage(widget.negocio.foto),
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
                                backgroundImage: AssetImage(widget.negocio.logo)
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            widget.negocio.nombre,
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
            ExpandableNotifier(
              child: Column(
                children: [
                  Expandable(
                    theme: const ExpandableThemeData(
                      hasIcon: true,
                      iconRotationAngle: 30,
                      tapBodyToCollapse: true,
                      useInkWell: true,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      scrollAnimationDuration: Duration(milliseconds: 1000),
                    ),
                    collapsed: ExpandableButton(
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Detalles',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(width: 30),
                            const Icon(Icons.arrow_drop_down_sharp)
                          ],
                        ),
                      ),
                    ),
                    expanded: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: [
                            Text(
                              'Direccion: ' + widget.negocio.direccion,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              'Telefono: ' + widget.negocio.telefono,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              'Celular: ' + widget.negocio.celular,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              'latitud: ' + widget.negocio.geolocalizacion.latitude.toString() + ' longitud: ' + widget.negocio.geolocalizacion.longitude.toString(),
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              'Pagina Web: ' + widget.negocio.pagina_web,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade200,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              width: double.infinity,
                              child: ExpandableButton(
                                child: const Icon(Icons.arrow_drop_up_sharp)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            FutureBuilder(
              future: CrudProductoNegocio().listarPorNegocio(widget.negocio),
              builder: (context,AsyncSnapshot<List<ProductoNegocio>> snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return ProductosListView(productos: snapshot.data?? []);
                }else{
                  return const CircularProgressIndicator();
                }
              }
            )
          ],
        ),
      ),
    );
  }
}