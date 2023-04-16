import 'package:classtenapp/state/auth/models/auth_result.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AuthState {
  final bool isLoading;
  final String? token;
  final AuthResult? result;

  const AuthState({
    required this.isLoading,
    required this.token,
    required this.result,
  });

  const AuthState.unknown()
      : isLoading = false,
        token = null,
        result = AuthResult.failed;
  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        isLoading: isLoading,
        token: token,
        result: result,
      );

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          token == other.token);

  @override
  int get hashCode => Object.hash(
        result,
        isLoading,
        token,
      );
}
