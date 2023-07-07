
import 'dart:convert';

import 'package:projet_master/apiroutes/apiroute.dart';
import 'package:http/http.dart' as http;
import 'package:projet_master/services/storage_service.dart';
class PointageService{

  static var client = http.Client();

  Future<bool> pointage(String email) async {
    Map<String, String> requestHeaders = {

      'Authorization': 'Bearer ${StorageService.getToken()}'
    };
    var requestUrl = Uri.http(
      ApiRoutes.apiURL,
      ApiRoutes.pointage,
    );

    var response = await client.post(
        Uri.parse('$requestUrl?email=$email'),
        headers: requestHeaders
    );
    print("esponse.statusCode  ${response.statusCode}");
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print("pointage okie");
      return responseJson;
    } else {
      print("pointage non okie");
      return false;
    }
  }
}