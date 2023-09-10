import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

//SideMenu para nuestro Drawer
// ¿Como sabremos que opcion sera seleccionada? Necesitamos un estado
class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  //Si quieramos que aparezca como seleccionado la ultima pestaña clickeada necesitariamos un
  //gestor de estados
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    //Determinando si hay un notch o espacio muerto en el dispositivo, no es necesario saber si es
    //android, ios, o lo que sea
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.url);
        //Si queremos hacer referencia a las propiedades de nuestro windegts dentro del state de
        //un stateful widget es necesario iniciar con la palaba widget
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10: 20, 15, 10),
          child: const Text("Main",)
          ),

        ...appMenuItems
          .sublist(0,3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.tittle),
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 14, 28, 10),
          child: Divider(),
        ),
        

        const Padding(
          padding:  EdgeInsets.fromLTRB(28, 10 , 15, 10),
          child: Text("Submenus",)
        ),

        ...appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.tittle),
          ),
        ),
      ],
    );
  }
} 