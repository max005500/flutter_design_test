import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double porcent = 10.0;
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
      body:
          Center(child: Text('$porcent', style: const TextStyle(fontSize: 50))),
    );
  }
}
