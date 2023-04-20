import 'package:classtenapp/state/auth/provider/auth_state_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/curves/bottom_curve.dart';
import '../../components/curves/bottom_curve_rev.dart';
import '../../components/curves/canvas_curve.dart';
import '../../components/curves/canvas_curve_rev.dart';
import 'register_page.dart';

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
    Size size = MediaQuery.of(context).size;
    final loginProvider = ref.watch(authStateProvider.notifier);
    login() async {
      var data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      await loginProvider.login(data);
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.greenAccent,
              content: Text("Please fill all the fields"),
            ),
          );
        }
      } else {
        var data = {
          'email': emailController.text,
          'password': passwordController.text,
        };
        // await loginProvider.login(data);
        if (await loginProvider.login(data) == true) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Invalid username or password"),
            ));
          }
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    // clipper: ,
                    clipper: CurveClipper(),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 255, 199, 134)
                          .withOpacity(0.6),
                    ),
                  ),
                  ClipPath(
                    // clipper: ,
                    clipper: CurveClipperRev(),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 255, 199, 134),
                    ),
                  ),
                  Positioned(
                    top: size.height / 12,
                    left: size.width / 2 - 125,
                    child: SizedBox(
                      height: 200,
                      width: 250,
                      child: Image.asset(
                        "assets/images/sikshyashala.png",
                        fit: BoxFit.contain,

                        // color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Login",
                style: TextStyle(
                    color: Color.fromARGB(255, 48, 181, 226), fontSize: 46),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        hintText: "User Email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: const TextStyle(color: Colors.black45),
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.password_outlined,
                          color: Colors.grey,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "forgot your password?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 70, 68, 161)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: login,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 171, 73)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 8),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 70, 68, 161),
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                            text: "Sign Up",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 8.7),
              Stack(
                children: [
                  ClipPath(
                    clipper: BottomCurve(),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 255, 228, 157),
                    ),
                  ),
                  ClipPath(
                    clipper: BottomCurveRev(),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 214, 162, 102)
                          .withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
