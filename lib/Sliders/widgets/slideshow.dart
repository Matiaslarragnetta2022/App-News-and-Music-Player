import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow({
    Key? key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => _SliderModel(),
        child: SafeArea(
          child: Center(
            child: Builder(
              builder: (BuildContext context) {
                Provider.of<_SliderModel>(context).colorPrimario =
                    colorPrimario;

                Provider.of<_SliderModel>(context).bulletPrimario =
                    bulletPrimario;
                Provider.of<_SliderModel>(context).bulletSecundario =
                    bulletSecundario;

                return _CrearEstructuraSlidershow(
                    puntosArriba: puntosArriba, slides: slides);
              },
            ),
          ),
        ));
  }
}

class _CrearEstructuraSlidershow extends StatelessWidget {
  const _CrearEstructuraSlidershow({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba)
          _Dots(
            totalSlides: slides.length,
          ),
        Expanded(
            child: _Slides(
          slides: slides,
        )),
        if (!puntosArriba) _Dots(totalSlides: slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots({
    required this.totalSlides,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides,
            (i) => _Dot(
                  index: i,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SliderModel>(context);
    double tamano;
    Color color;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({required this.slides});

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      //print('Pagina actual: ${pageViewController.page}');

      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: pageViewController,
        children: widget.slides
            .map((slide) => _Slide(
                  slide: slide,
                ))
            .toList());
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: slide,
        ));
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color colorPrimario = Colors.blue;
  Color colorSecundario = Colors.grey;
  double bulletPrimario = 12;
  double bulletSecundario = 12;

  double get currentPage => _currentPage;
  set currentPage(double pagina) {
    _currentPage = pagina;

    notifyListeners();
  }
}
