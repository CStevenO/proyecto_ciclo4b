import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo4b/dao/cliente_crud.dart';
import 'package:proyecto_ciclo4b/models/cliente.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class EditarCliente extends StatefulWidget{
  Cliente cliente;
  var nombre = TextEditingController();
  var direccion = TextEditingController();
  var celular = TextEditingController();

  EditarCliente({
    Key? key,
    required this.cliente
  }): super(key: key);

  @override
  State<EditarCliente> createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarCliente> {
  @override
  Widget build(BuildContext context) {
    widget.nombre.text = widget.cliente.nombre;
    widget.direccion.text = widget.cliente.direccion;
    widget.celular.text = widget.cliente.celular;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(widget.cliente),
        ),
      ),
      body: SafeArea(
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
                  TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre',
                      ),
                      controller: widget.nombre
                  ),
                  const SizedBox(height: 20),
                  TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Dirección',
                      ),
                      controller: widget.direccion
                  ),
                  const SizedBox(height: 20),
                  TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Celular',
                      ),
                      controller: widget.celular
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    child: const Text('Editar Perfil'),
                    onPressed: () {
                      widget.cliente.nombre = widget.nombre.text;
                      widget.cliente.direccion = widget.direccion.text;
                      widget.cliente.celular = widget.celular.text;
                      Future.microtask(() => CrudCliente().editarCliente(widget.cliente));
                      Navigator.pop(
                        context,
                        widget.cliente
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}