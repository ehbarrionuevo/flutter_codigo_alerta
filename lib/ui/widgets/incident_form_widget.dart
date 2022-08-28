import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_aux_model.dart';
import 'package:flutter_codigo_alerta/models/incident_type_model.dart';
import 'package:flutter_codigo_alerta/services/api_service.dart';
import 'package:flutter_codigo_alerta/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:geolocator/geolocator.dart';

class IncidentFormWidget extends StatefulWidget {
  List<IncidentTypeModel> incidentTypes;

  IncidentFormWidget({required this.incidentTypes});

  @override
  State<IncidentFormWidget> createState() => _IncidentFormWidgetState();
}

class _IncidentFormWidgetState extends State<IncidentFormWidget> {
  APIService apiService = APIService();
  int indexSelected = 0;
  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexSelected = widget.incidentTypes.first.id;
  }

  registerIncident() {

    Geolocator.getCurrentPosition().then((Position value){
      latitude = value.latitude;
      longitude = value.longitude;
      IncidentAuxModel incidentAuxModel = IncidentAuxModel(
        latitud: latitude,
        longitud: longitude,
        tipoIncidente: indexSelected,
        estado: "Abierto",
      );
      apiService.registerIncident(incidentAuxModel);
    });



  }

  @override
  Widget build(BuildContext context) {
    print(widget.incidentTypes);
    return Container(
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          divider12,
          const Text(
            "Por favor, selecciona y envia la alerta correspondiente.",
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          divider20,
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
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
                value: indexSelected,
                isExpanded: true,
                items: widget.incidentTypes
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.id,
                        child: Text(
                          e.titulo,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (int? value) {
                  indexSelected = value!;
                  setState(() {});
                },
              ),
            ),
          ),
          divider20,
          ButtonNormalWidget(
            text: "Enviar alerta",
            onPressed: () {
              registerIncident();
            },
          ),
          divider12,
        ],
      ),
    );
  }
}
