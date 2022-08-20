import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          //Fondo

          Positioned(
            top: - height * 0.18,
            left: - height * 0.05,
            child: Transform.rotate(
              angle: pi / 4,
              child: Container(
                height: height * 0.6,
                width: height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(height * 0.17),
                ),
              ),
            ),
          ),

          //Contenido principal
        ],
      ),
    );
  }
}
