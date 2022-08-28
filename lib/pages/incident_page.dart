import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  title: "assd",
                  subtitle: "asdads",
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
