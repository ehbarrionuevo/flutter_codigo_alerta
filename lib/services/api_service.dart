import 'dart:convert';
import 'package:flutter_codigo_alerta/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIService {
  login() async {
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
    }
  }
}
