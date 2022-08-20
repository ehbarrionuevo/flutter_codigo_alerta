import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          //Fondo

          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -height * 0.18,
                left: -height * 0.05,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Container(
                    height: height * 0.6,
                    width: height * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(height * 0.17),
                      gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xffC064DD),
                          Color(0xff5D28FE),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -20,
                left: -30,
                child: circleWidget(90),
              ),

              Positioned(
                top: 40,
                right: -80,
                child: circleWidget(100),
              ),
            ],
          ),

          //Contenido principal

          Text("Hola"),
        ],
      ),
    );
  }
}
