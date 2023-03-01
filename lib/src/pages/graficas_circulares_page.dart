import 'package:design/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double porcent = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(
                () {
                  porcent += 10;
                  if (porcent > 100) {
                    porcent = 0;
                  }
                },
              ),
          child: const Icon(Icons.refresh)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 180,
                child: RadialProgress(
                  porcentaje: porcent,
                  colorPrimaio: Colors.blue,
                  // colorSecundario: Colors.white,
                ),
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: RadialProgress(
                  porcentaje: porcent,
                  colorPrimaio: Colors.pink,
                  // colorSecundario: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: RadialProgress(
                  porcentaje: porcent,
                  colorPrimaio: Colors.purple,
                  // colorSecundario: Colors.white,
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: RadialProgress(
                  porcentaje: porcent,
                  colorPrimaio: Colors.green,
                  // colorSecundario: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
