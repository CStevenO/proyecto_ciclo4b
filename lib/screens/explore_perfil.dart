import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/components/editar_cliente.dart';
import 'package:proyecto_ciclo4b/models/cliente.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ExplorePerfil extends StatefulWidget{
  Cliente cliente;

  ExplorePerfil({
    Key? key,
    required this.cliente,
  }): super(key: key);

  @override
  State<ExplorePerfil> createState() => _ExplorePerfilState();
}

class _ExplorePerfilState extends State<ExplorePerfil> {

  void updateCliente(Cliente _cliente){
    setState(() => widget.cliente = _cliente);
  }

  void moveEditarCliente() async {
    final Cliente _cliente;
    _cliente = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarCliente(cliente: widget.cliente),
      ),
    );
    updateCliente(_cliente);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 50,
          right: 50,
          top: 20,
        ),
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 300),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 40.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                const Material(
                  elevation: 15,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('bgtienda.png'),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.cliente.user,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Nombre:',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      widget.cliente.nombre,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Dirección:',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      widget.cliente.direccion,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Celular:',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      widget.cliente.celular,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  child: const Text('Editar Perfil'),
                  onPressed: (){
                    moveEditarCliente();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}