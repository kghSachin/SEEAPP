import 'package:classtenapp/state/ui/navbarbackend/nav_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavNotifier extends StateNotifier<NavStates> {
  NavNotifier() : super(const NavStates());
  void onIndexChanged(int index) {
    state = state.copyWith(index: index);
    //saving state for later so we can access state.index
  }
}
