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
      if (result == AuthResult.success) {
        print("balla xiryo vitra");
      }
      state = AuthState(
          isLoading: false,
          token: "token jhikaula katei bata aaba ",
          result: result);
    } catch (e) {
      print(e.toString());
    }
  }
}
