import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_model.dart';
import 'package:flutter_codigo_alerta/models/incident_type_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/incident_detail_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/incident_form_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/item_list_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class IncidentPage extends StatefulWidget {
  const IncidentPage({Key? key}) : super(key: key);

  @override
  State<IncidentPage> createState() => _IncidentPageState();
}

class _IncidentPageState extends State<IncidentPage> {
  APIService apiService = APIService();
  List<IncidentTypeModel> incidentTypes = [];

  @override
  initState() {
    super.initState();
    apiService.getIncidentTypes().then((value) {
      if (value.isNotEmpty) {
        incidentTypes = value;
      }
    });
  }

  showRegisterIncident() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return IncidentFormWidget(
          incidentTypes: incidentTypes,
        );
      },
    );
  }

  showDetailIncident(IncidentModel model) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          contentPadding: EdgeInsets.zero,
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
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
                  onTap: () async{
                    await FlutterPhoneDirectCaller.callNumber(model.datosCiudadano.telefono);
                  },
                  child: IncidentDetailWidget(
                    title: "Teléfono",
                    description: model.datosCiudadano.telefono,
                  ),
                ),

                InkWell(
                  onTap: (){
                    launchUrl(Uri.parse("https://www.google.com/maps/?q=${model.latitud},${model.longitud}"));
                  },
                  child: IncidentDetailWidget(
                    title: "Ubicación",
                    description: "Ver en el mapa",
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kFontPrimaryColor,
        onPressed: () {
          showRegisterIncident();
        },
        child: Icon(Icons.add),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: MyAppBar(
          title: "Incidentes",
        ),
      ),
      body: FutureBuilder(
        future: apiService.getIncidents(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<IncidentModel> incidents = snap.data;
            return ListView.builder(
              itemCount: incidents.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemListWidget(
                  title: incidents[index].tipoIncidente.titulo,
                  subtitle:
                      "${incidents[index].datosCiudadano.nombres} | ${incidents[index].fecha}",
                  onTap: () {
                    showDetailIncident(incidents[index]);
                  },
                );
              },
            );
          }
          return loadingWidget();
        },
      ),
    );
  }
}
