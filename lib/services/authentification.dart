import 'dart:convert';

import 'package:projet_master/apiroutes/apiroute.dart';
import 'package:http/http.dart' as http;
import 'package:projet_master/services/storage_service.dart';

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
      print("responseJson.toString() ${responseJson.toString()}");
      StorageService.setEmail(responseJson['email']);
      StorageService.setToken(responseJson['token']);
      StorageService.setFirstName(responseJson['firstName']);
      StorageService.setLastName(responseJson['lastName']);
      print("token ${StorageService.getToken()}");
      print("email ${StorageService.getEmail()}");

      return true;
    } else {
      print("mot de passe incorrect");
      return false;
    }
  }
}