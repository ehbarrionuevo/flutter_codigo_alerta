
import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
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
    );
  }
}
