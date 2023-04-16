import 'package:classtenapp/state/auth/provider/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverPodLogin extends ConsumerStatefulWidget {
  const RiverPodLogin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverPodLoginState();
}

class _RiverPodLoginState extends ConsumerState<RiverPodLogin> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = ref.watch(authStateProvider.notifier);
    login() {
      var data = {
        'contact': emailController.text,
        'password': passwordController.text,
      };
      loginProvider.login(data);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("This is the login Page "),
      ),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: emailController,
          ),
          TextField(
            controller: passwordController,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: login,
            child: Text("Press me"),
          )
        ],
      )),
    );
  }
}
