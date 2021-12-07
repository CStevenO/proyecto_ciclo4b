import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductoView extends StatefulWidget{
  ProductoNegocio productoNegocio;
  var cantidad = TextEditingController();
  ProductoView({
    Key? key,
    required this.productoNegocio,
  }): super(key: key);

  @override
  State<ProductoView> createState() => _ProductoViewState();
}

class _ProductoViewState extends State<ProductoView> {
  int cantidad = 0;

  void adicionar(){
    setState(() {
      cantidad = cantidad + 1;
    });
  }

  void restar(){
    setState(() {
      cantidad = cantidad - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.cantidad.text = cantidad as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productoNegocio.producto.nombre,
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
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.productoNegocio.producto.foto),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.productoNegocio.producto.nombre,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$ ' + widget.productoNegocio.precio.toString(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: const Icon(Icons.remove_circle_outline_rounded,size: 7),
                              onTap: (){
                                return restar();
                              },
                            ),
                            TextField(
                              controller: widget.cantidad,
                              enabled: false,
                            ),
                            GestureDetector(
                              child: const Icon(Icons.add_circle_outline_rounded,size: 7),
                              onTap: (){
                                return adicionar();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: const Card(
                            child: Icon(Icons.add_shopping_cart_rounded,size: 15),
                            elevation: 5,
                          ),
                          onTap: (){
                            //TODO: Agregar la animacion de enviar al carrito de compras y salir de producto para luego agregar eso a la base de datos del carrito
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}