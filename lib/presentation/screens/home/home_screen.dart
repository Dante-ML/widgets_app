import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';


class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Esta key va a mantener el scaffold state
    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter + Material 3')
      ),
      body: const _HomeView(),
      
      drawer: SideMenu(scaffoldKey: scaffoldKey,),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    //Mostrar con un ListView.builder
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context,index){
        final menuItem = appMenuItems[index];

        //Regresar el texto con un ListTile
        return _CustomListTile(menuItem: menuItem);
      }
    );

  }
}



class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),
      title: Text(menuItem.tittle),
      subtitle: Text(menuItem.subTittle),
      splashColor: colors.secondary,
      onTap: (){
        
        //Navigator: Navegacion entre pantallas, push indica poner una sobre otra
        /*Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ButtonScreen(),
          ),
        );*/
        //Navigator.pushNamed(context,menuItem.url);
        


        //Implementacion por path
        context.push(menuItem.url);

        //Implementacion por name PEROO tendriamos que agregar la propieda de name en menu_items
        //Porque aqui como esta puesto siempre nos va a llevar a CardsScreen.name
        //context.pushNamed(CardsScreen.name);
      },
    );
  }
}