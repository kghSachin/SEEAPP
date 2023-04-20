import 'package:classtenapp/state/ui/navbarbackend/nav_notifier.dart';
import 'package:classtenapp/state/ui/navbarbackend/nav_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navProvider =
    StateNotifierProvider<NavNotifier, NavStates>((ref) => NavNotifier());
