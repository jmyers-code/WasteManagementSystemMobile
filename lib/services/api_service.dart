import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:wms_project/models/collection_request_model.dart';
import 'package:wms_project/models/login_response_model.dart';
import 'package:wms_project/models/register_request_model.dart';
import 'package:wms_project/services/shared_service.dart';
import '../config.dart';
import '../models/get_collection_data.dart';
import '../models/login_request_model.dart';

class ApiService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.apiURL + Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      //Save user details
      await SharedService.setLoginDetails(
        loginResponseJson(response.body),
      );
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> saveCollectionData(CollectionRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.apiURL + Config.saveCollectionData);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      // await SharedService.setLoginDetails(
      //   loginResponseJson(response.body),
      // );
      return true;
    } else {
      return false;
    }
  }

  static Future<GetCollectionResponseData> getCollectionData() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.apiURL + Config.getCollectionData);

    var response = await client.get(url);

    print("hi");

    if (response.statusCode == 200) {
      // await SharedService.setLoginDetails(
      //   loginResponseJson(response.body),
      // );
      return GetCollectionResponseData.fromJson(
          jsonDecode(response.body).toList());
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  static Future<bool> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authourization': 'Basic ${loginDetails!.token}'
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      //Save user details
      // await SharedService.setLoginDetails(
      //   loginResponseJson(response.body),
      // );
      return response.body;
    } else {
      return "";
    }
  }
}
