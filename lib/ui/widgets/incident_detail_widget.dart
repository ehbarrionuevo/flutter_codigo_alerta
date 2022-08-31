
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';

class IncidentDetailWidget extends StatelessWidget {
  const IncidentDetailWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            "Tipo de Alerta:",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: kFontPrimaryColor.withOpacity(0.85),
            ),
          ),
          divider10Width,
          Text(
            "Secuestro",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: kFontPrimaryColor.withOpacity(0.85),
            ),
          ),
        ],
      ),
    );
  }
}
