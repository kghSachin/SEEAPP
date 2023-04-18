import 'package:classtenapp/state/auth/backend/authenticator.dart';
import 'package:classtenapp/state/auth/models/auth_result.dart';
import 'package:classtenapp/state/auth/models/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState.unknown());
  final authLogin = const Authenticator();
  Future<void> login(data) async {
    state = state.copiedWithIsLoading(true);
    try {
      final result = await authLogin.login(data);
      state = AuthState(
        isLoading: false,
        token: Authenticator.userToken,
        result: result,
      );
      if (result == AuthResult.success) {
        // return true;
      }
    } catch (e) {
      print(e.toString());
    }
    // return false;
  }
}
