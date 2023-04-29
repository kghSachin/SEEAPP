import 'package:classtenapp/state/services/postBackend/create_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostNotifier extends StateNotifier<bool> {
  CreatePostNotifier() : super(false);
  set isLoading(bool value) => state = value;

  Future<bool> makePost(data) async {
    try {
      bool result = await createPost(data);
      return result;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
