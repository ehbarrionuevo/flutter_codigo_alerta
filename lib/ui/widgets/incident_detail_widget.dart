import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';

class IncidentDetailWidget extends StatelessWidget {
  String title;
  String description;

  IncidentDetailWidget({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: kFontPrimaryColor.withOpacity(0.85),
            ),
          ),
          divider10Width,
          Text(
            description,
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
