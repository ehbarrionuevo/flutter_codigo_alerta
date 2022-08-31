import 'package:flutter/material.dart';
import 'package:flutter_codigo_alerta/models/incident_model.dart';
import 'package:flutter_codigo_alerta/ui/widgets/alert_incident_detail_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/general_widget.dart';
import 'package:flutter_codigo_alerta/ui/widgets/incident_detail_widget.dart';
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
  initState() {
    super.initState();
    getMarkers();
  }

  getMarkers() {
    widget.incidents.forEach((element) {
      Marker myMarker = Marker(
          markerId: MarkerId(_markers.length.toString()),
          position: LatLng(element.latitud, element.longitud),
          onTap: () {
            showDetailIncident(element);
          });
      _markers.add(myMarker);
    });
    setState(() {});
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
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              zoom: 6,
              target: LatLng(-16.382905, -71.543986),
            ),
            // onTap: (LatLng position) {
            //   Marker myMarker = Marker(
            //       markerId: MarkerId(_markers.length.toString()),
            //       position: position);
            //   _markers.add(myMarker);
            //   setState(() {});
            // },
            markers: _markers,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.incidents.map((e) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10.0),
                  margin:  EdgeInsets.symmetric(horizontal: 6, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          "https://images.pexels.com/photos/1707820/pexels-photo-1707820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          height: 100,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      divider10Width,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IncidentDetailWidget(title: "Tipo de alerta", description: "Mordedura",),
                          IncidentDetailWidget(title: "Tipo de alerta", description: "Mordedura",),
                          IncidentDetailWidget(title: "Tipo de alerta", description: "Mordedura",),
                        ],
                      ),
                    ],
                  ),
                ),).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
