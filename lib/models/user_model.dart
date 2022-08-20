class UserModel {
  int id;
  String dni;
  String nombreCompleto;
  String telefono;
  String direccion;
  String? token;

  UserModel({
    required this.id,
    required this.dni,
    required this.nombreCompleto,
    required this.telefono,
    required this.direccion,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        dni: json["dni"],
        nombreCompleto: json["nombreCompleto"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        token: json["token"] ?? "",
      );
}
