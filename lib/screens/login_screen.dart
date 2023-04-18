import 'package:classtenapp/screens/all_post_screen.dart';
import 'package:classtenapp/state/auth/provider/auth_state_provider.dart';
import 'package:classtenapp/state/services/postBackend/get_post.dart';
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
    login() async {
      var data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      await loginProvider.login(data);
      // if (logged == true) {
      //   if (mounted) {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) => const MainScreen(),
      //       ),
      //     );
      //   }
      // }
    }

    retrive() {
      GetPost().getPost();
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
            child: const Text("Press me"),
          ),
          TextButton(
            onPressed: retrive,
            child: const Text("getPost"),
          )
        ],
      )),
    );
  }
}
