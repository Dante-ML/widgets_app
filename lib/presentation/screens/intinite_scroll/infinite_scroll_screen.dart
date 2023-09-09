import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const name = 'infinite_screen';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
 
  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) >= (scrollController.position.maxScrollExtent)){
       //Load next page
       //Cabe destacar que esto va a estar haciendo evaluaciones a cada rato
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  //Carga las nuevas imagenes en el ListView
  Future loadNextPage() async {
    if(isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    //Si no se revisa podemos mandar a llamar un setstate de un widget que ya no existe, lo cual
    //puede causar que se termine nuestra aplicacion prematuramente
    if(!isMounted)return;
    setState(() {});
    moveScrollToBottom();
  }

  //Funciona que evalua si se llego al final de la pantalla y mueve al usuario hacia abajo cuando
  //cargan las siguiente imagenes
  void moveScrollToBottom(){
    //Es una condicion para asegurarnos que el usuario esta cerca del final
    if((scrollController.position.pixels + 100) <= (scrollController.position.maxScrollExtent))return;
    scrollController.animateTo(
      scrollController.position.pixels + 150, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }


  void addFiveImages(){
    final lastId = imagesIds.last;

    //Esto seria lo mismo que ir agregandolos 1 por 1
    //imagesIds.add(lastId +1);
    //imagesIds.add(lastId +2);
    //imagesIds.add(lastId +3);
    //imagesIds.add(lastId +4);
    //imagesIds.add(lastId +5);

    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted)return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId+1);
    addFiveImages();

    setState(() {  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        //List view con las imagenes
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListImages(scrollController: scrollController, imagesIds: imagesIds)
        ),
      ),
      
      //Buton de regreso / indicador de pagina cargando
      floatingActionButton: FloatingActionButton(
        onPressed:() => context.pop(),
        child: isLoading ? JelloIn(
          duration: const Duration(seconds: 1),
          child: SpinPerfect(
            //Este fue mi intento, el de fer esta en el codigo no comentado
            //animate: isLoading,
            infinite: true,
            child: const Icon(Icons.refresh_rounded)
          ),
        ): FadeInRight(duration: const Duration(milliseconds: 700),child: const Icon(Icons.arrow_back_ios_new_outlined),)
      ),


    );
  }
}

class ListImages extends StatelessWidget {
  const ListImages({
    super.key,
    required this.scrollController,
    required this.imagesIds,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;

  @override
  Widget build(BuildContext context) {
    //La descripcion del builder nos indica que este es preferible para scrolls infinitos
    //Esto se hace para no tener todos los elementos en memorioa, sino que se construyan bajo demanda
    return ListView.builder(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: imagesIds.length,
      itemBuilder: (context,index){
        //Nos permite mostrar una imagen mientras carga otra
        return FadeInImage(
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
          placeholder: const AssetImage('assets/images/jar-loading.gif'), 
          image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
        );
      }
    );
  }
}