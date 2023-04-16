import 'package:classtenapp/state/auth/models/auth_state.dart';
import 'package:classtenapp/state/auth/notifier/auth_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);
