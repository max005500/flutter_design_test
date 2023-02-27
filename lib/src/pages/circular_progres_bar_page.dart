import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgressBarPage extends StatefulWidget {
  const CircularProgressBarPage({super.key});

  @override
  State<CircularProgressBarPage> createState() =>
      _CircularProgressBarPageState();
}

class _CircularProgressBarPageState extends State<CircularProgressBarPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double porcent = 10.0;
  double newPorcent = 0.0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    controller.addListener(() {
      setState(() {
        porcent = lerpDouble(porcent, newPorcent, controller.value) ?? 0;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(
                () {
                  porcent = newPorcent;
                  newPorcent += 10;
                  if (newPorcent > 100) {
                    newPorcent = 0;
                    porcent = 0;
                  }
                  controller.forward(from: 0.0);
                },
              ),
          child: const Icon(Icons.refresh)),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.all(5),
          child: CustomPaint(painter: _MyRadiusProggres(porcent: porcent)),
          decoration: const BoxDecoration(
              // color: Colors.red,
              // shape: BoxShape.circle,
              ),
        ),
      ),
    );
  }
}

class _MyRadiusProggres extends CustomPainter {
  double porcent;
  _MyRadiusProggres({required this.porcent});
  @override
  void paint(Canvas canvas, Size size) {
    final Color color = const Color(0xff615AAB);
    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);

    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // NOTE: correcto pero poco reutilizable, funcion para dibujar circulo
    //final path = Path()..moveTo(size.width, size.height * 0.5);
    // for (int i = 0; i <= 365; i++) {
    //   path.lineTo(
    //     (size.width * 0.5) + 150 * cos(i * pi / 180),
    //     (size.height * 0.5) + 150 * sin(i * pi / 180),
    //   );
    // }
    // canvas.drawPath(path, paint);

    canvas.drawCircle(center, radius, paint);
    double arcAngle = 2 * pi * (porcent * 0.01);

    final paintArc = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
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
