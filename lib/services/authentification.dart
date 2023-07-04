import 'dart:convert';

import 'package:projet_master/apiroutes/apiroute.dart';
import 'package:http/http.dart' as http;

class Authentification{

   static var client = http.Client();

  Future<bool> login(String phone, String  password) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
    };
    var requestUrl = Uri.http(
      ApiRoutes.apiURL,
      ApiRoutes.signin,
    );

    var response = await client.post(
      requestUrl,
      //headers: requestHeaders,
      body: {"email":phone,"password":password},
    );
    print("esponse.statusCode  ${response.statusCode}");
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
    
      return true;
    } else {
      print("mot de passe incorrect");
      return false;
    }
  }
}