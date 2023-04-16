import 'package:classtenapp/state/auth/models/auth_result.dart';
import 'package:classtenapp/state/auth/provider/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final isLoggedIn = ref.watch(authStateProvider);
  return isLoggedIn.result == AuthResult.success;
});
