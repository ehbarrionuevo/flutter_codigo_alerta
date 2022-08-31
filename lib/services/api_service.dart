import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_codigo_alerta/models/citizen_model.dart';
import 'package:flutter_codigo_alerta/models/incident_aux_model.dart';
import 'package:flutter_codigo_alerta/models/incident_model.dart';
import 'package:flutter_codigo_alerta/models/incident_type_model.dart';
import 'package:flutter_codigo_alerta/models/news_model.dart';
import 'package:flutter_codigo_alerta/models/user_model.dart';
import 'package:flutter_codigo_alerta/pages/citizen_page.dart';
import 'package:flutter_codigo_alerta/utils/constants.dart';
import 'package:flutter_codigo_alerta/utils/formatter.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

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



  Future<List<NewsModel>> getNews() async {
    try {
      String path = "$pathProduction/noticias/";
      Uri url = Uri.parse(path);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        String responseDecode =  utf8.decode(response.bodyBytes);
        List list = json.decode(responseDecode);
        List<NewsModel> newsList = list.map((e) => NewsModel.fromJson(e)).toList();
        return newsList;
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

  Future<NewsModel?> registerNews(NewsModel model, File image) async{

    String path = "$pathProduction/noticias/";
    Uri url = Uri.parse(path);
    final request = http.MultipartRequest("POST", url);
    List<String> mimeType = mime(image.path)!.split("/");

    http.MultipartFile file = await http.MultipartFile.fromPath(
      "imagen",
      image.path,
      contentType: MediaType(mimeType[0], mimeType[1]),
    );

    request.files.add(file);
    request.fields["titulo"] = model.titulo;
    request.fields["link"] = model.link;
    request.fields["fecha"] = model.fecha.toString().substring(0,10);

    http.StreamedResponse streamedResponse = await request.send();

    http.Response response = await http.Response.fromStream(streamedResponse);
    print(response.statusCode);
    if(response.statusCode == 201){
      String responseDecode =  utf8.decode(response.bodyBytes);
      Map<String, dynamic> myMap = json.decode(responseDecode);
      NewsModel newsModel = NewsModel.fromJson(myMap);
      return newsModel;
    }

    return null;

  }

  Future<List<IncidentModel>> getIncidents() async{
    try {
      String path = "$pathProduction/incidentes/";
      Uri url = Uri.parse(path);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        List list = json.decode(response.body);
        List<IncidentModel> incidentList = list.map((e) => IncidentModel.fromJson(e)).toList();
        return incidentList;
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


  Future<IncidentModel?> registerIncident(IncidentAuxModel model) async{

    String path = "$pathProduction/incidentes/crear/";
    Uri url = Uri.parse(path);
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token 4ba755b2add893f43e5fa004f7fe3b67d4249f38",
      },
      // body: json.encode(
      //     {
      //       "latitud": -16.361625,
      //       "longitud": -71.568773,
      //       "tipoIncidente": 2,
      //       "estado": "Abierto"
      //     }
      // ),
      body: json.encode(model.toJson()),
    );

    if(response.statusCode == 201){
      Map<String, dynamic> myMap = json.decode(response.body);
      IncidentModel incidentModel = IncidentModel.fromJson(myMap);
      return incidentModel;
    }

    return null;

  }



}
