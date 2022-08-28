import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/pages/citizen_page.dart';
import 'package:flutter_codigo_alerta/pages/incident_page.dart';
import 'package:flutter_codigo_alerta/pages/incident_type_page.dart';
import 'package:flutter_codigo_alerta/pages/news_page.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/background_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/item_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Fondo
          const BackgroundWidget(),
          //Contenido principal
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    divider30,
                    const Text(
                      "Alerta municipal",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                    divider12,
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0),
                    ),
                    divider40,
                    GridView.count(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      children: [
                        ItemMenuWidget(
                          text: "Ciudadanos",
                          toPage: CitizenPage(),
                        ),
                        ItemMenuWidget(
                          text: "Tipo Incidentes",
                          toPage: IncidentTypePage(),
                        ),
                        ItemMenuWidget(
                          text: "Noticias",
                          toPage: NewsPage(),
                        ),
                        ItemMenuWidget(
                          text: "Incidentes",
                          toPage: IncidentPage(),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
