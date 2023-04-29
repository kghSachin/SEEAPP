import 'package:classtenapp/state/auth/provider/auth_state_provider.dart';
import 'package:classtenapp/state/services/providers/create_post_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoadingProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider);
  final creatingPost = ref.watch(createPostProvider);
  return authState.isLoading || creatingPost;
});
