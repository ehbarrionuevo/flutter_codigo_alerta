import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_model.dart';
import 'package:flutter_codigo_alerta/models/incident_type_model.dart';
import 'package:flutter_codigo_alerta/pages/incident_map_page.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/alert_incident_detail_widget.dart';
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
  List<IncidentModel> incidents = [];

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
        return AlertIncidentDetailWidget(model: model);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => IncidentMapPage(incidents: incidents,)));
            },
            child: Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kFontPrimaryColor,
              ),
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
          ),
          divider6,
          FloatingActionButton(
            backgroundColor: kFontPrimaryColor,
            onPressed: () {
              showRegisterIncident();
            },
            child: Icon(Icons.add),
          ),
        ],
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

            incidents = snap.data;

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
