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
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        // var body = response.body;
        dynamic postlist = jsonDecode(response.body);
        print(postlist);

        // print(response.body);
        // print(postlist['posts']);
        // var allpost = postlist['posts'];

        // print(response);
        // print(postlist);
        for (var post in postlist['posts']) {
          print(post);
          RetrivePostModel model = RetrivePostModel.fromMap(post);
          print(model);
          postList.add(model);
          // print(postList[0].description);
        }
      }
    } catch (e) {
      print("eroorroor " + e.toString());
      rethrow;
    }
    // print(postList[0]);
    print(postList);
    return postList;
  }
}

final postProvider = Provider<GetPost>((ref) => GetPost());
