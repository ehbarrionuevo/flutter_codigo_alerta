import 'dart:convert';

import 'package:http/http.dart' as http;

class APIService {
  login() async {
    String path = "http://alertahunter.herokuapp.com/API/login/";
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
    print(response.statusCode);
  }
}
