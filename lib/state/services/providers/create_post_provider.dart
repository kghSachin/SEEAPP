import 'package:classtenapp/state/services/notifiers/create_post_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPostProvider = StateNotifierProvider<CreatePostNotifier, bool>(
  (ref) => CreatePostNotifier(),
);
