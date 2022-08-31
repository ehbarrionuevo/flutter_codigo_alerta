
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_model.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/incident_detail_widget.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertIncidentDetailWidget extends StatelessWidget {

  IncidentModel model;
  AlertIncidentDetailWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Detalle de la alerta",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: kFontPrimaryColor,
              ),
            ),
            Divider(),
            IncidentDetailWidget(
              title: "Tipo de alerta",
              description: model.tipoIncidente.titulo,
            ),
            IncidentDetailWidget(
              title: "Fecha",
              description: model.fecha,
            ),
            IncidentDetailWidget(
              title: "Hora",
              description: model.hora,
            ),
            IncidentDetailWidget(
              title: "Ciudadano",
              description: model.datosCiudadano.nombres,
            ),
            InkWell(
              onTap: () async {
                await FlutterPhoneDirectCaller.callNumber(
                    model.datosCiudadano.telefono);
              },
              child: IncidentDetailWidget(
                title: "Teléfono",
                description: model.datosCiudadano.telefono,
              ),
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(
                    "https://www.google.com/maps/?q=${model.latitud},${model.longitud}"));
              },
              child: IncidentDetailWidget(
                title: "Ubicación",
                description: "Ver en el mapa",
              ),
            ),
            IncidentDetailWidget(
              title: "Origen",
              description: model.tipoOrigen,
            ),
            divider6,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: kFontPrimaryColor,
                  ),
                  child: Text(
                    "Aceptar",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
