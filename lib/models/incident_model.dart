
import 'package:flutter_codigo_alerta/models/citizen_aux_model.dart';
import 'package:flutter_codigo_alerta/models/incident_type_model.dart';

class IncidentModel {
  IncidentModel({
    required this.id,
    required this.tipoIncidente,
    required this.longitud,
    required this.latitud,
    required this.fecha,
    required this.hora,
    required this.datosCiudadano,
    required this.estado,
    required this.tipoOrigen,
  });

  int id;
  IncidentTypeModel tipoIncidente;
  double longitud;
  double latitud;
  String fecha;
  String hora;
  CitizenAuxModel datosCiudadano;
  String estado;
  String tipoOrigen;


  factory IncidentModel.fromJson(Map<String, dynamic> json) => IncidentModel(
    id: json["id"],
    tipoIncidente: IncidentTypeModel.fromJson(json["tipoIncidente"]),
    longitud: json["longitud"].toDouble(),
    latitud: json["latitud"].toDouble(),
    fecha: json["fecha"],
    hora: json["hora"],
    datosCiudadano: CitizenAuxModel.fromJson(json["datosCiudadano"]),
    estado: json["estado"],
    tipoOrigen: json["tipoOrigen"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipoIncidente": tipoIncidente.toJson(),
    "longitud": longitud,
    "latitud": latitud,
    "fecha": fecha,
    "hora": hora,
    "datosCiudadano": datosCiudadano.toJson(),
    "estado": estado,
    "tipoOrigen": tipoOrigen,
  };
}


