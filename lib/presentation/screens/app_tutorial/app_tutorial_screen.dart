import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String tittle;
  final String caption;
  final String imageUrl;

  SlideInfo(this.tittle, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Deserunt fugiat Lorem proident veniam aliqua laborum fugiat deserunt ex sunt anim.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Ullamco est ipsum irure enim culpa et voluptate irure labore ullamco nostrud excepteur.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta tu pedido',
      'Do velit exercitation amet labore voluptate irure consectetur id dolore ex ipsum consequat ullamco.',
      'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    tittle: slideData.tittle,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 15,
              top: 35,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String tittle;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.tittle, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titteStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(
            height: 20,
          ),
          Text(
            tittle,
            style: titteStyle,
          ),
          const SizedBox(height: 10),
          Text(
            caption,
            style: captionStyle,
          ),
        ],
      )),
    );
  }
}
