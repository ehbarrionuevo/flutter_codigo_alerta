import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IncidentMapPage extends StatefulWidget {
  const IncidentMapPage({Key? key}) : super(key: key);

  @override
  State<IncidentMapPage> createState() => _IncidentMapPageState();
}

class _IncidentMapPageState extends State<IncidentMapPage> {
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          zoom: 6,
          target: LatLng(-16.382905, -71.543986),
        ),
        onTap: (LatLng position) {
          Marker myMarker = Marker(
            markerId: MarkerId("id001"),
            position: position
          );
          _markers.add(myMarker);
          setState((){});
        },
        markers: _markers,
      ),
    );
  }
}
