import 'package:classtenapp/components/loading/loading_screen.dart';
import 'package:classtenapp/screens/authpages/login_screen.dart';
import 'package:classtenapp/screens/main_screen.dart';
import 'package:classtenapp/state/auth/provider/is_loading_provider.dart';
import 'package:classtenapp/state/auth/provider/is_loggedin_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shikshya Shala',
      theme: ThemeData(
        primaryColor: Colors.grey,
        colorScheme: const ColorScheme.light(
          primary: Colors.orangeAccent,
          secondary: Colors.grey,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        primarySwatch: Colors.deepPurple,
      ),
      home: Consumer(
        builder: (context, ref, child) {
          ref.listen<bool>(isLoadingProvider, (_, isLoading) {
            // print(isLoading.toString());
            if (isLoading) {
              LoadingScreen.instance().show(context: context);
            } else {
              LoadingScreen.instance().hide();
            }
          });
          final isLogged = ref.watch(isLoggedInProvider);
          if (isLogged) {
            return const HomePage3();
          } else {
            return const RiverPodLogin();
          }
        },
      ),
    );
  }
}
