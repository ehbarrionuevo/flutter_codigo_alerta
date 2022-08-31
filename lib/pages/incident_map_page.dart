import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_model.dart';
import 'package:flutter_codigo_alerta/ui/widgets/alert_incident_detail_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IncidentMapPage extends StatefulWidget {
  List<IncidentModel> incidents;

  IncidentMapPage({required this.incidents});

  @override
  State<IncidentMapPage> createState() => _IncidentMapPageState();
}

class _IncidentMapPageState extends State<IncidentMapPage> {
  Set<Marker> _markers = {};

  @override
  initState(){
    super.initState();
    getMarkers();
  }

  getMarkers() {
    widget.incidents.forEach((element) {
      Marker myMarker = Marker(
        markerId: MarkerId(_markers.length.toString()),
        position: LatLng(element.latitud, element.longitud),
        onTap: (){
          showDetailIncident(element);
        }
      );
      _markers.add(myMarker);
    });
    setState((){});
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
    print(widget.incidents);
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          zoom: 6,
          target: LatLng(-16.382905, -71.543986),
        ),
        onTap: (LatLng position) {
          Marker myMarker = Marker(
              markerId: MarkerId(_markers.length.toString()),
              position: position);
          _markers.add(myMarker);
          setState(() {});
        },
        markers: _markers,
      ),
    );
  }
}
