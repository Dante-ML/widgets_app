import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
//import 'package:go_router/go_router.dart';

class CounterScreen extends ConsumerWidget{
  static const name = "counter_river";
  
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Va a estar pendiente del counter provider
    final valor = ref.watch(counterProvider);
    var isDarkMode = ref.watch(isDarkModeProvider);
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
         actions: [
          IconButton(
            icon: Icon(isDarkMode == true ? Icons.dark_mode_outlined :Icons.light_mode_outlined),
            onPressed: (){
              //OJITO AQUI
              //Hay que llamar al provider pendejo no a la variable
              ref.watch(isDarkModeProvider.notifier).update(
                (isDarkMode) => !isDarkMode);
            },
          )
         ],
        
      ),
      //Hay varias formas de utilizar el StateProvider:
      //Podemos extender el widget con un ConsumerWiget el cual es un builder especial de riverpod
      //O convertir e
      body: Center(
        child: Text("Valor: $valor",style: Theme.of(context).textTheme.titleLarge,),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //No uses los watch en metodos!!!!

          //Hay varias manera de hacer cambios en el estado, por ejemplo aqui utilizamos 
          //el notifier para acceder al estado de nuestro provider
          ref.read(counterProvider.notifier).state++;
          
          //La otra forma es,  
          //ref.read(counterProvider.notifier).update((state) => state++);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}