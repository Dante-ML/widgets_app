import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const name = 'snackbar_screen';

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('holiii'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){},),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Dolor elit eiusmod eu aliqua. Ut minim minim minim laboris sint amet sint ipsum. Nisi nostrud qui do mollit aliquip est ut exercitation. Excepteur incididunt exercitation tempor sint magna nostrud et fugiat elit cillum voluptate culpa. Proident adipisicing ad enim reprehenderit commodo velit aliqua cillum Lorem duis consequat et est ut. Dolore exercitation voluptate veniam dolore aliquip amet dolore eiusmod.'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancel')),
          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar')),
        ],
      ),
      );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos')
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              child: const Text('licencias usadas'),
              onPressed: (){
                showAboutDialog(context: context,
                  children: [
                    const Text('Nostrud ipsum elit ea elit in occaecat ea. Ea laboris excepteur laborum reprehenderit sint nostrud labore Lorem Lorem id. Officia enim excepteur et labore irure labore consectetur officia officia. Deserunt exercitation qui nostrud aliquip sunt incididunt dolore eu. Id duis et laborum mollit veniam mollit sunt veniam.'),
                  ]
                );
              }, 
            ),

            FilledButton.tonal(
              child: const Text('Mostrar dialogo'),
              onPressed: (){
                openDialog(context);
              }, 
            ),
          ],
        )
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: (){
          //Hay varias formas de mostrar snackbars pero necesita un scaffold?
          showCustomSnackbar(context);
        },
        ),

    );
  }
}