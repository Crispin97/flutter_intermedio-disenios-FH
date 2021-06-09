import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}



class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70.0), 
          bottomRight: Radius.circular(70.0)
        ),
        color: Color(0xff615AAB)
      ),
    );
  }
}



class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final lapiz = new Paint();

      // Propiedades
      lapiz.color = Color(0xff615AAB);
      lapiz.style = PaintingStyle.fill;
      lapiz.strokeWidth = 2;

      final path = new Path();

      // Dibujar con el path y el lapiz
      path.moveTo(0, size.height * 0.35);
      path.lineTo(size.width, size.height * 0.30);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
      // path.lineTo(0, size.height * 0.5);

      canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final lapiz = new Paint();

      // Propiedades
      lapiz.color = Color(0xff615AAB);
      lapiz.style = PaintingStyle.fill;
      lapiz.strokeWidth = 2;

      final path = new Path();

      // Dibujar con el path y el lapiz
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final lapiz = new Paint();

      // Propiedades
      lapiz.color = Color(0xff615AAB);
      lapiz.style = PaintingStyle.fill;
      lapiz.strokeWidth = 20;

      final path = new Path();

      // Dibujar con el path y el lapiz
      path.lineTo(0, size.height * 0.25);
      path.lineTo(size.width * 0.5, size.height * 0.30);
      path.lineTo(size.width, size.height * 0.25);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final lapiz = new Paint();

      // Propiedades
      lapiz.color = Color(0xff615AAB);
      lapiz.style = PaintingStyle.fill;
      lapiz.strokeWidth = 20;

      final path = new Path();

      // Dibujar con el path y el lapiz
      path.lineTo(0, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final lapiz = new Paint();

      // Propiedades
      lapiz.color = Color(0xff615AAB);
      lapiz.style = PaintingStyle.fill;
      lapiz.strokeWidth = 20;

      final path = new Path();

      // Dibujar con el path y el lapiz
      path.lineTo(0, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
      path.lineTo(size.width, 0);

      // Waves en la parte inferior
      
      // path.moveTo(0, size.height);
      // path.lineTo(0, size.height * 0.8);
      // path.quadraticBezierTo(size.width * 0.25, size.height * 0.85, size.width * 0.5, size.height * 0.8);
      // path.quadraticBezierTo(size.width * 0.75, size.height * 0.75, size.width, size.height * 0.8);
      // path.lineTo(size.width, size.height);

      canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

      final Rect rect = new Rect.fromCircle(
        center: Offset(0.0, 55.0),
        radius: 180
      );

      final Gradient gradiente = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA)
        ],
        stops: [
          0.2,
          0.5,
          1.0
        ]
      );

      final lapiz = new Paint()..shader = gradiente.createShader(rect);

      // Propiedades
      // lapiz.color = Color(0xff615AAB);
      lapiz.style = PaintingStyle.fill;
      lapiz.strokeWidth = 20;

      final path = new Path();

      // Dibujar con el path y el lapiz
      path.lineTo(0, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.75, size.height * 0.2, size.width, size.height * 0.25);
      path.lineTo(size.width, 0);

      canvas.drawPath(path, lapiz);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



