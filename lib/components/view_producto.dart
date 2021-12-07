import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/models/negocio.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProducto extends StatelessWidget{
  ProductoNegocio producto;

  ViewProducto({
    Key? key,
    required this.producto,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Card(
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(producto.producto.foto),
                    fit: BoxFit.cover
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Chip(
                      label: Text(
                        producto.negocio,
                        style: GoogleFonts.openSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.black.withOpacity(0.7),
                    ),
                    top: 16,
                    right: 16,
                  ),
                ],
              ),
            ),
            Container(
              height: 75,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    Positioned(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            producto.producto.nombre,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            '\$ ' + producto.precio.toString(),
                            style: GoogleFonts.openSans(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      left: 15,
                      top: 7,
                    ),
                    Positioned(
                      child:
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple.shade500,
                          elevation: 15,
                        ),
                        onPressed: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              const Icon(Icons.add,color: Colors.white),
                              const SizedBox(width: 5),
                              Text('Agregar',style: Theme.of(context).textTheme.headline6)
                            ],
                          ),
                        )
                      ),
                      top: 16,
                      right: 16,
                    )
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}