import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen')
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //on router lo permite
          context.pop();

          //o sino podemos usar navigator
          //Navigator.of(context).pop();

        },
        child: const Icon(Icons.arrow_back_ios_rounded)
      ),
    );
  }
}


class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final themecolor = Theme.of(context).colorScheme;

    return SizedBox(
      //Llega al maximo posible del padre
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated'),),
    
            //Al darle null el boton por defecto esta desabilitado
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled'),),
    
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.waving_hand_outlined), 
              label: const Text('Elevated Icon')
            ),

            FilledButton(onPressed: (){}, child: const Text('Filled')),

            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.accessibility_new), 
              label: const Text('Filled Icon'),
            ),

            OutlinedButton(onPressed: (){}, child: const Text('Outlined')),

            OutlinedButton.icon(
              onPressed: (){}, 
              label: const Text('Outlined Icon'), 
              icon: const Icon(Icons.terminal_outlined),
            ),

            TextButton(onPressed: (){}, child: const Text('Text')),

            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.yard_outlined), 
              label: const Text('Text Icon')
            ),
          
            const CustomButton(),

            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_outlined)),

            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_outlined),
              style: ButtonStyle(
                //Hay muchos estados del button material por eso el ALL pero se puede elegir uno por uno
                backgroundColor: MaterialStatePropertyAll(themecolor.secondary),
                iconColor: const MaterialStatePropertyAll(Colors.amberAccent),
              ),
            ),

          ],
        ),
      ),
    );
  }
}



class CustomButton extends StatelessWidget {
  const CustomButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style: TextStyle(color: Colors.white),)
          ),
        ),
      ),
    );
  }
}