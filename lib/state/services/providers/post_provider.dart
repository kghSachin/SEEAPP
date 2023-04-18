import 'package:classtenapp/state/auth/models/retrive_post_model.dart';
import 'package:classtenapp/state/services/postBackend/get_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allPostProvider = FutureProvider<List<RetrivePostModel>>((ref) {
  return ref.watch(postProvider).getPost();
});
