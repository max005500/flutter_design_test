import 'dart:math';
import 'package:flutter/material.dart';

class CircularProgressBarPage extends StatefulWidget {
  const CircularProgressBarPage({super.key});

  @override
  State<CircularProgressBarPage> createState() =>
      _CircularProgressBarPageState();
}

class _CircularProgressBarPageState extends State<CircularProgressBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
      ),
    );
  }
}
