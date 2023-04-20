import 'package:classtenapp/screens/authpages/login_screen.dart';
import 'package:classtenapp/state/auth/provider/auth_state_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/curves/bottom_curve.dart';
import '../../components/curves/bottom_curve_rev.dart';
import '../../components/curves/canvas_curve.dart';
import '../../components/curves/canvas_curve_rev.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController firstnameController;
  late final TextEditingController lastnameController;
  late final TextEditingController usernameController;

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
    lastnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstnameController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = ref.watch(authStateProvider.notifier);
    register() async {
      var data = {
        "email": emailController.text,
        "first_name": firstnameController.text,
        "last_name": lastnameController.text,
        "username": usernameController.text,
        "password": passwordController.text,
      };
      bool result = await registerProvider.register(data);
      if (result == true) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text("You have been registered successfully"),
          ),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RiverPodLogin(),
          ),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Something Went Wrong! Try again"),
          ),
        );
      }
    }

    Size size = MediaQuery.of(context).size;
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
                    top: size.height / 14,
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
              // const SizedBox(height: 20),
              const Text(
                "Sign Up",
                style: TextStyle(
                    color: Color.fromARGB(255, 48, 181, 226), fontSize: 46),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: size.width / 2.5,
                            child: TextField(
                              controller: firstnameController,
                              decoration: InputDecoration(
                                // focusedBorder: OutlineInputBorder(),
                                hintText: "First Name",
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 20,
                                ),
                              ),
                            )),
                        const Spacer(),
                        SizedBox(
                            width: size.width / 2.5,
                            child: TextField(
                              controller: lastnameController,
                              decoration: InputDecoration(
                                // focusedBorder: OutlineInputBorder(),
                                hintText: "Last Name",
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 20,
                                ),
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: size.width / 2.5,
                            child: TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                // focusedBorder: OutlineInputBorder(),
                                hintText: "Username",
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.5),
                                  fontSize: 20,
                                ),
                              ),
                            )),
                        const Spacer(),
                        SizedBox(
                          width: size.width / 2.5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              // focusedBorder: OutlineInputBorder(),
                              hintText: "Contact",
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: register,
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
                            EdgeInsets.symmetric(horizontal: 55, vertical: 6),
                        child: Text(
                          "Sign Up",
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
                            text: "Already have an account? ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 70, 68, 161),
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RiverPodLogin()));
                              },
                            text: "Log in",
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
              SizedBox(height: size.height / 14),
              Stack(
                children: [
                  ClipPath(
                    clipper: BottomCurve(),
                    child: Container(
                      height: size.height / 8,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 255, 228, 157),
                    ),
                  ),
                  ClipPath(
                    clipper: BottomCurveRev(),
                    child: Container(
                      height: size.height / 8,
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
