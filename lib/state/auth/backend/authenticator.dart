import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/auth_result.dart';

class Authenticator {
  static String? userToken;
  const Authenticator();

  Future<AuthResult> register(data) async {
    String fullUrl =
        "http://si-back.pi-innovations.com.np/api/v1/token/register";
    try {
      http.Response response = await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'charset': 'utf-8',
        },
      );
      print(response.statusCode);
      final code = response.statusCode;
      if (code == 200 || code == 201) {
        return AuthResult.success;
      }
      return AuthResult.failed;
    } catch (error) {
      return AuthResult.failed;
    }
  }

  Future<AuthResult> login(data) async {
    String fullUrl = "http://si-api.sikshyashala.com/user/login/";
    try {
      http.Response response = await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'charset': 'utf-8',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> tokenData = jsonDecode(response.body);
        print(tokenData['token']);
        if (tokenData['token'] != null) {
          userToken = tokenData['token'];
        } else {
          userToken = null;
        }
        return AuthResult.success;
      }
      return AuthResult.failed;
    } catch (error) {
      return AuthResult.failed;
    }
  }
}
