import 'dart:math';
import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> op;
  late Animation<double> tr;
  late Animation<double> gr;
  @override
  void initState() {
    super.initState;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2.0 * pi).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuad));

    op = Tween(begin: 0.2, end: 1.0).animate(controller);
    tr = Tween(begin: 0.0, end: 200.0).animate(controller);
    gr = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutSine));

    controller.addListener(
      () {
        if (controller.status == AnimationStatus.completed) {
          controller.reset();
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Transform.translate(
      offset: Offset(tr.value, 0),
      child: AnimatedBuilder(
        animation: controller,
        child: _Rectangulo(),
        builder: (context, child) {
          return Transform.rotate(
            angle: rotation.value,
            child: Opacity(
                opacity: op.value,
                child: Transform.scale(scale: gr.value, child: child)),
          );
        },
      ),
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.pink),
    );
  }
}
