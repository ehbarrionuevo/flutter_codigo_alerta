

// To parse this JSON data, do
//
//     final incidentAuxModel = incidentAuxModelFromJson(jsonString);



class IncidentAuxModel {
  IncidentAuxModel({
    required this.latitud,
    required this.longitud,
    required this.tipoIncidente,
    required this.estado,
  });

  double latitud;
  double longitud;
  int tipoIncidente;
  String estado;

  factory IncidentAuxModel.fromJson(Map<String, dynamic> json) => IncidentAuxModel(
    latitud: json["latitud"].toDouble(),
    longitud: json["longitud"].toDouble(),
    tipoIncidente: json["tipoIncidente"],
    estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
    "latitud": latitud,
    "longitud": longitud,
    "tipoIncidente": tipoIncidente,
    "estado": estado,
  };
}
