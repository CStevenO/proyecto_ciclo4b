import 'package:flutter/material.dart';
import 'tienda.dart';

class TiendaDetail extends StatefulWidget{
  final Tienda tienda;

  const TiendaDetail({
    Key? key,
    required this.tienda,
}): super(key: key);

  @override
  _TiendaDetailState createState(){
    return _TiendaDetailState();
  }
}

//TODO: Agregar _TiendaDetailState aqui
class _TiendaDetailState extends State<TiendaDetail> {
  //TODO:agregar _sliderVar aqui

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tienda.label),
      ),

      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.tienda.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),

            Text(
              widget.tienda.label,
              style: const TextStyle(fontSize: 18),
            ),
            //TODO: agregar Expanded
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.tienda.informations.length,
                itemBuilder: (BuildContext context,int index){
                  final tienda = widget.tienda.informations[index];
                  return Text(
                      '${tienda.nombre} ${tienda.telefono} ${tienda.direccion}'
                  );
                },
              ),
            ),

            //TODO: Agregar Slider() aqui
          ],
        ),
      ),
    );
  }
}