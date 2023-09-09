import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String tittle;
  final String caption;
  final String imageUrl;

  //Constructor posicional no es muy reutilizable pero en este caso
  //no nos interesa mucho 
  SlideInfo(this.tittle, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Reprehenderit est cillum consectetur veniam eu ullamco nulla laborum dolor labore eu ex fugiat.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Labore enim dolore occaecat aliquip dolore enim.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Mollit enim ipsum nostrud incididunt deserunt quis esse duis consectetur incididunt eiusmod.', 'assets/images/3.png')

];


class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});
  static const name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  bool isFinal = false;
  final PageController pageViewControler = PageController();

  @override
  void initState() {
    super.initState();
    pageViewControler.addListener(() {
      final page = pageViewControler.page ?? 0;
      if (!isFinal && page>=slides.length-1.5){
        setState(() {
          isFinal = true;
        });
      }
     });
  }

  @override
  void dispose() {
    pageViewControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewControler,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                tittle: slideData.tittle, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
              )
              //Esto es un iterable pero se puede convertir a una lista de widget que es lo que espera children
            ).toList()
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Skip tutorial'),
              onPressed: () => context.pop(), 
            )
          ),

          //Este boton solo deberia de aparecer al final
          //Para saber cuando pasa esto usaremos un booleano y el listener
          isFinal ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 14,
              duration: const Duration(seconds: 1),
              child: FilledButton(
                child: const Text("Comenzar"),
                onPressed: () => context.pop(),
              ),
            )
          ) : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String tittle;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.tittle, 
    required this.caption, 
    required this.imageUrl
  });


  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20,),
            Text(
              tittle,
              style: titleStyle
            ),
            const SizedBox(height: 20,),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        )
      ),
    );
  }
}