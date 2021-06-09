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
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey, 
    this.bulletPrimario = 12, 
    this.bulletSecundario = 12,
  });

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: ( _ ) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: _CrearEstructureSlideshow(puntosArriba: puntosArriba, slides: slides),
        )
      ),
      builder: (BuildContext context, Widget widget){
        Provider.of<_SlideshowModel>(context, listen: false).colorPrimario = this.colorPrimario;
        Provider.of<_SlideshowModel>(context, listen: false).colorSecundario = this.colorSecundario;

        Provider.of<_SlideshowModel>(context, listen: false).bulletPrimario = this.bulletPrimario;
        Provider.of<_SlideshowModel>(context, listen: false).bulletSecundario = this.bulletSecundario;

        return widget;
      },
    );
  }
}


class _CrearEstructureSlideshow extends StatelessWidget {
  const _CrearEstructureSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(this.puntosArriba) 
          _Dots(this.slides.length),
        Expanded(
          child: _Slides(this.slides)
        ),
        if(!this.puntosArriba) 
          _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index))
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final ssModel = Provider.of<_SlideshowModel>(context);
    final seleccionado = (ssModel.currentPage >= this.index - 0.5 && ssModel.currentPage < index + 0.5);
    final size = seleccionado ? ssModel.bulletPrimario : ssModel.bulletSecundario;

    return AnimatedContainer(
      duration: new Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: seleccionado ? ssModel.colorPrimario : ssModel.colorSecundario,
        shape: BoxShape.circle
      ),
    );
  }
}

  // child: SvgPicture.asset('assets/svgs/slide-1.svg'),
class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener((){
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList()
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide( this.slide );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide
    );
  }
}

class _SlideshowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage){
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color){
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color){
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bullet){
    this._bulletPrimario = bullet;
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bullet){
    this._bulletSecundario = bullet;
  }
}