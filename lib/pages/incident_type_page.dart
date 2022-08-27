
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_type_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/item_list_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/my_appbar_widget.dart';

class IncidentTypePage extends StatelessWidget {

  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {

    apiService.getIncidentTypes();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: MyAppBar(
          title: "Tipo Incidentes",
        ),
      ),
      body: FutureBuilder(
        future: apiService.getIncidentTypes(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<IncidentTypeModel> incidentTypes = snap.data;
            return incidentTypes.isNotEmpty
                ? ListView.builder(
              itemCount: incidentTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemListWidget(
                  title: incidentTypes[index].titulo,
                  subtitle: incidentTypes[index].area,
                );
              },
            )
                : emptyDataWidget();
          }
          return loadingWidget();
        },
      ),
    );
  }
}
