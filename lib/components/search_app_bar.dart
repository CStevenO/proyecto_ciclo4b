import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_ciclo4b/dao/producto_negocio_crud.dart';
import 'package:proyecto_ciclo4b/models/producto_negocio.dart';
import 'package:proyecto_ciclo4b/screens/productos_screen.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget{
  late bool prim;
  SearchAppBar({Key? key, this.prim = true}) : super(key: key);
  final AppBar appBar = AppBar();

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

}

class _SearchAppBarState extends State<SearchAppBar> {
  Icon customIcon = const Icon(Icons.search, color: Colors.white);

  final TextEditingController _texto = TextEditingController();

  Widget customSearchBar = Text('Tiendita',
    style: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );



  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: customSearchBar,
      automaticallyImplyLeading: false,
      leading: widget.prim? null: IconButton(
        icon: const Icon(Icons.arrow_back,color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          onPressed: (){
            setState(() {
              if(customIcon.icon == Icons.search){
                customIcon = const Icon(Icons.cancel,color: Colors.white);
                customSearchBar = ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.search,color: Colors.white),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductosScreen(nombre: _texto.text),
                        ),
                      );
                    },
                  ),
                  title: TextField(
                    controller: _texto,
                    decoration: InputDecoration(
                      hintText: 'Qué producto buscas...',
                      hintStyle: GoogleFonts.openSans(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                        color: Colors.white
                    ),
                  ),
                );
              } else{
                customIcon = const Icon(Icons.search, color: Colors.white);
                customSearchBar = Text('Tiendita',
                  style: GoogleFonts.openSans(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                );
              }
            });
          },
          icon: customIcon,
        )
      ],
    );
  }
}