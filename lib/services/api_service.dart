import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_codigo_alerta/models/user_model.dart';
import 'package:flutter_codigo_alerta/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIService {

  Future<UserModel?> login() async {
    try{
      String path = "$pathProduction/login/";
      Uri url = Uri.parse(path);
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "username": "47707721",
            "password": "3volution",
          },
        ),
      );
      if(response.statusCode == 200){
        Map<String, dynamic> myMap = json.decode(response.body);
        UserModel user = UserModel.fromJson(myMap["user"]);
        user.token = myMap["access"];
        return user;
      }
      return null;

    } on TimeoutException catch(e){
      return Future.error("Error en el servidor");
    } on SocketException catch(e){
      return Future.error("Error con el internet");
    } on Error catch (e){
      return Future.error("Error del programador");
    }
  }
}
