import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // Controlador de desplazamiento para la ListView
  final ScrollController scrollController = ScrollController();
  bool isLoading = false; // Indica si se están cargando más imágenes
  bool isMounted = true; // Indica si el widget está montado en el árbol de widgets

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // Este método se llama cada vez que se desplaza la ListView

      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Si el usuario ha bajado lo suficiente en el scroll, carga más imágenes
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    // Se llama cuando el widget se elimina del árbol de widgets
    scrollController.dispose();
    isMounted = false; // El widget ya no está montado
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFileImages(); // Simula cargar más imágenes
    isLoading = false;
    if (!isMounted)
      return; // Si el widget ya no está montado, no actualiza el estado
    setState(() {});

    //todo: mover scroll
  }

  void addFileImages() {
    final lastId = imagesIds.last;
    // Agrega más imágenes a la lista
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              // Construye cada elemento de la ListView, que muestra imágenes
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'));
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(), // Navega hacia atrás
          child: isLoading
              ? SpinPerfect(infinite: true, child: const Icon(Icons.refresh_rounded))
              : FadeIn(child: const Icon(Icons.arrow_back_ios_outlined)),
        ),
    );
  }
}
