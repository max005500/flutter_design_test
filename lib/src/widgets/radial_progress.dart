import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimaio;
  final Color colorSecundario;
  const RadialProgress({
    super.key,
    required this.porcentaje,
    required this.colorPrimaio,
    this.colorSecundario = Colors.grey,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double prevPorcent;
  @override
  void initState() {
    prevPorcent = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
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

    final diff = widget.porcentaje - prevPorcent;
    prevPorcent = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _MyRadiusProggres(
              colorSecundario: widget.colorSecundario,
              colorPrimario: widget.colorPrimaio,
              porcent: (widget.porcentaje - diff) + diff * controller.value),
        ),
      ),
    );
  }
}

class _MyRadiusProggres extends CustomPainter {
  double porcent;
  Color colorPrimario;
  Color colorSecundario;
  _MyRadiusProggres({
    required this.porcent,
    required this.colorPrimario,
    required this.colorSecundario,
  });
  @override
  void paint(Canvas canvas, Size size) {
    // const Color color = Color(0xff615AAB);
    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);

    final paint = Paint()
      ..color = colorSecundario
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(center, radius, paint);
    double arcAngle = 2 * pi * (porcent * 0.01);

    final paintArc = Paint()
      ..color = colorPrimario
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi * 0.5,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
