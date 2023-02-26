import 'dart:math';

import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      color: const Color(0xff615AAB),
      child: null,
    );
  }
}

class HeaderBorderRadius extends StatelessWidget {
  const HeaderBorderRadius({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          bottomRight: Radius.circular(90),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: CustomPaint(
        painter: _HeaderDiagonal(),
      ),
    );
  }
}

class HeaderTriangulo extends StatelessWidget {
  const HeaderTriangulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: CustomPaint(
        painter: _HeaderTriangulo(),
      ),
    );
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: CustomPaint(
        painter: _HeaderPico(),
      ),
    );
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: CustomPaint(
        painter: _HeaderCurvo(),
      ),
    );
  }
}

class HeaderOndas extends StatelessWidget {
  const HeaderOndas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: CustomPaint(
        painter: _HeaderOndas(),
      ),
    );
  }
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: CustomPaint(
        painter: _HeaderOndasGradient(),
      ),
    );
  }
}

class _HeaderDiagonal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    final path = Path();
    path.moveTo(0, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderTriangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    final path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    final path = Path();
    path.moveTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final double middle = size.height * 0.25;
    //NOTE: const double convert = (pi / 180);
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    final path = Path();

    //NOTE: forma poco practica
    // for (int i = 0; i <= size.width; i++) {
    //   path.lineTo(i.toDouble(),
    //       middle + 100 * sin(0.5 * 0.91 * (i * convert - 0 * convert)));
    // }

    path.lineTo(0, middle);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.40, size.width, middle);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderOndas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final double middle = size.height * 0.7;
    // const double convert = (pi / 180);
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 5;
    final path = Path();

    //NOTE: forma poco practica
    // for (int i = 0; i <= size.width; i++) {
    //   path.lineTo(i.toDouble(),
    //       middle + 50 * sin(1 * 0.91 * (i * convert - 0 * convert)));
    // }

    path.moveTo(0, size.height);
    path.lineTo(0, middle);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.60, size.width * 0.5, middle);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.80, size.width, middle);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderOndasGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(size.width * 0.5, 55),
      radius: size.width,
    );
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6d05e8),
        Color(0xffc012ff),
        Color(0xff6d05fa),
      ],
    );
    final paint = Paint()..shader = gradient.createShader(rect);
    final double middle = size.height * 0.3;
    // paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    final path = Path();
    path.lineTo(0, middle);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.4, size.width * 0.5, middle);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.2, size.width, middle);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
