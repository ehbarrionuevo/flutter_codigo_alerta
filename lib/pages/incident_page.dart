import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/general/colors.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/item_list_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';

class IncidentPage extends StatefulWidget {
  const IncidentPage({Key? key}) : super(key: key);

  @override
  State<IncidentPage> createState() => _IncidentPageState();
}

class _IncidentPageState extends State<IncidentPage> {
  APIService apiService = APIService();

  showRegisterIncident() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
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
              DropdownButton(
                value: 1,
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
                onChanged: (value){

                },
              ),
            ],
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
