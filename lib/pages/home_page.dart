import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/widgets/background_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          //Fondo
          BackgroundWidget(),
          //Contenido principal

          Text("Hola"),
        ],
      ),
    );
  }
}
