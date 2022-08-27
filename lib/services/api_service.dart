import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_codigo_alerta/models/citizen_model.dart';
import 'package:flutter_codigo_alerta/models/incident_type_model.dart';
import 'package:flutter_codigo_alerta/models/user_model.dart';
import 'package:flutter_codigo_alerta/pages/citizen_page.dart';
import 'package:flutter_codigo_alerta/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<UserModel?> login(String username, String pwd) async {
    try {
      String path = "$pathProduction/login/";
      Uri url = Uri.parse(path);
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "username": username,
            "password": pwd,
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> myMap = json.decode(response.body);
        UserModel user = UserModel.fromJson(myMap["user"]);
        user.token = myMap["access"];
        return user;
      }
      return null;
    } on TimeoutException catch (e) {
      return Future.error(
          "Hubo un inconveniente con servicio, inténtalo nuevamente.");
    } on SocketException catch (e) {
      return Future.error(
          "Hubo un inconveniente con el interner, inténtalo nuevamente.");
    } on Error catch (e) {
      return Future.error("Hubo un inconveniente, inténtalo nuevamente.");
    }
  }

  Future<List<CitizenModel>> getCitizens() async {
    try {
      String path = "$pathProduction/ciudadanos/";
      Uri url = Uri.parse(path);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> myMap = json.decode(response.body);
        List<CitizenModel> citizenList = myMap["data"]
            .map<CitizenModel>((e) => CitizenModel.fromJson(e))
            .toList();
        return citizenList;
      }
      return [];
    } on TimeoutException catch (error) {
      return Future.error(
          "Hubo un inconveniente con servicio, inténtalo nuevamente.");
    } on SocketException catch (error) {
      return Future.error(
          "Hubo un inconveniente con el interner, inténtalo nuevamente.");
    } on Error catch (error) {
      return Future.error("Hubo un inconveniente, inténtalo nuevamente.");
    }
  }

  Future<List<IncidentTypeModel>> getIncidentTypes() async {
    try {
      String path = "$pathProduction/incidentes/tipos/";
      Uri url = Uri.parse(path);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        List list = json.decode(response.body);
        List<IncidentTypeModel> incidentTypeList = list.map((e) => IncidentTypeModel.fromJson(e)).toList();
        return incidentTypeList;
      }
      return [];
    } on TimeoutException catch (error) {
      return Future.error(
          "Hubo un inconveniente con servicio, inténtalo nuevamente.");
    } on SocketException catch (error) {
      return Future.error(
          "Hubo un inconveniente con el interner, inténtalo nuevamente.");
    } on Error catch (error) {
      return Future.error("Hubo un inconveniente, inténtalo nuevamente.");
    }
  }



  Future<List<IncidentTypeModel>> getNews() async {
    try {
      String path = "$pathProduction/noticias/";
      Uri url = Uri.parse(path);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        List list = json.decode(response.body);
        List<IncidentTypeModel> incidentTypeList = list.map((e) => IncidentTypeModel.fromJson(e)).toList();
        return incidentTypeList;
      }
      return [];
    } on TimeoutException catch (error) {
      return Future.error(
          "Hubo un inconveniente con servicio, inténtalo nuevamente.");
    } on SocketException catch (error) {
      return Future.error(
          "Hubo un inconveniente con el interner, inténtalo nuevamente.");
    } on Error catch (error) {
      return Future.error("Hubo un inconveniente, inténtalo nuevamente.");
    }
  }



}
