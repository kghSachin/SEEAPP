import 'package:classtenapp/state/auth/provider/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoadingProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.isLoading;
});
