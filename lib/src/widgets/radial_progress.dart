import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  const RadialProgress({ 
    @required this.porcentaje, 
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey, 
    this.grosorSecundario = 4, 
    this.grosorPrimario = 10
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(vsync: this, duration: new Duration(milliseconds: 800));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller, 
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
              widget.colorPrimario,
              widget.colorSecundario,
              widget.grosorPrimario,
              widget.grosorSecundario
            ),
          ),
        );
      }, 
    );

  }
}

class _MiRadialProgress extends CustomPainter{
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorPrimario,
    this.grosorSecundario
  );

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180
    );

    final Gradient gradiente = new LinearGradient(
      colors: [
          Color(0xffC012FF),
          Color(0xff6D05E8),
          Colors.red
        ]
    );

    // Circulo completado
    final paint = new Paint()
      ..strokeWidth = this.grosorSecundario
      ..color = this.colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset centro = new Offset(size.width * 0.5, size.height * 0.5);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(centro, radio, paint);  

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = this.grosorPrimario
      // ..color = this.colorPrimario
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Parte que se debera ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: centro, radius: radio), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;  
}