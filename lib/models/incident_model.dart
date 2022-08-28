
class IncidentModel {
  IncidentModel({
    this.id,
    this.tipoIncidente,
    this.longitud,
    this.latitud,
    this.fecha,
    this.hora,
    this.datosCiudadano,
    this.estado,
    this.tipoOrigen,
  });

  int id;
  TipoIncidente tipoIncidente;
  double longitud;
  double latitud;
  String fecha;
  String hora;
  DatosCiudadano datosCiudadano;
  String estado;
  String tipoOrigen;


  factory IncidentModel.fromJson(Map<String, dynamic> json) => IncidentModel(
    id: json["id"],
    tipoIncidente: TipoIncidente.fromJson(json["tipoIncidente"]),
    longitud: json["longitud"].toDouble(),
    latitud: json["latitud"].toDouble(),
    fecha: json["fecha"],
    hora: json["hora"],
    datosCiudadano: DatosCiudadano.fromJson(json["datosCiudadano"]),
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

class DatosCiudadano {
  DatosCiudadano({
    this.nombres,
    this.dni,
    this.telefono,
  });

  String nombres;
  String dni;
  String telefono;

  factory DatosCiudadano.fromJson(Map<String, dynamic> json) => DatosCiudadano(
    nombres: json["nombres"],
    dni: json["dni"],
    telefono: json["telefono"],
  );

  Map<String, dynamic> toJson() => {
    "nombres": nombres,
    "dni": dni,
    "telefono": telefono,
  };
}

class TipoIncidente {
  TipoIncidente();

  factory TipoIncidente.fromJson(Map<String, dynamic> json) => TipoIncidente(
  );

  Map<String, dynamic> toJson() => {
  };
}
