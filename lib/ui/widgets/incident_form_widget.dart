import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';

class IncidentFormWidget extends StatefulWidget {
  const IncidentFormWidget({Key? key}) : super(key: key);

  @override
  State<IncidentFormWidget> createState() => _IncidentFormWidgetState();
}

class _IncidentFormWidgetState extends State<IncidentFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          divider12,
          Text(
            "Por favor, selecciona y envia la alerta correspondiente.",
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          divider20,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: 1,
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text(
                      "Elemento 1",
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(
                      "Elemento 2",
                    ),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text(
                      "Elemento 3",
                    ),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
          ),
          divider20,
          ButtonNormalWidget(
            text: "Enviar alerta",
            onPressed: () {},
          ),
          divider12,
        ],
      ),
    );
  }
}
