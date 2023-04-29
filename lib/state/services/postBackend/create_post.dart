import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../auth/backend/authenticator.dart';

Future<bool> createPost(data) async {
  String fullUrl = "http://si-api.sikshyashala.com/post/create/";
  try {
    http.Response response = await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {
        "Authorization": "Token ${Authenticator.userToken!}",
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
    print("oops Something went wrong on post view !${error.toString()}");
    return false;
  }
}
