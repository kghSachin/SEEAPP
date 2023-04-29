import 'dart:convert';

import 'package:classtenapp/state/auth/backend/authenticator.dart';
import 'package:classtenapp/state/auth/models/retrive_post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class GetPost {
  static const String fullUrl = "http://si-api.sikshyashala.com/posts/";
  Future<List<RetrivePostModel>> getPost() async {
    List<RetrivePostModel> postList = [];
    try {
      Uri url = Uri.parse(fullUrl);
      http.Response response = await http.get(url,
          headers: {"Authorization": "Token ${Authenticator.userToken!}"});
      print("here line 17 ${response.statusCode}");
      if (response.statusCode == 200) {
        print(response.body);
        // var body = response.body;
        dynamic postlist = jsonDecode(response.body);
        print("line 22 get_post: $postlist");

        for (var post in postlist) {
          print(post);

          RetrivePostModel model = RetrivePostModel.fromMap(post);

          postList.add(model);
        }
      }
    } catch (e) {
      print("eroorroor " + e.toString());
      rethrow;
    }

    return postList;
  }
}

final postProvider = Provider<GetPost>((ref) => GetPost());
