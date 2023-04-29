import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/auth_result.dart';

class Authenticator {
  static String? userToken;
  const Authenticator();
  AuthResult logout() {
    Future.delayed(const Duration(seconds: 2));
    userToken = null;
    return AuthResult.failed;
  }

  Future<bool> register(data) async {
    String fullUrl = "http://si-api.sikshyashala.com/user/create/";
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
        return true;
      }
      return false;
    } catch (error) {
      print("oops Something went wrong!");
      return false;
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
        if (tokenData['token'] != null) {
          userToken = tokenData['token'];
          print("This is User token" + userToken.toString());
          return AuthResult.success;
        } else {
          userToken = null;
        }
        // return AuthResult.success;
      }
      return AuthResult.failed;
    } catch (error) {
      SnackBar(content: Text(error.toString()));
      return AuthResult.failed;
    }
  }
}
