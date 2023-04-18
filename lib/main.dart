import 'package:classtenapp/components/loading/loading_screen.dart';
import 'package:classtenapp/screens/all_post_screen.dart';
import 'package:classtenapp/screens/login_screen.dart';
import 'package:classtenapp/state/auth/provider/is_loading_provider.dart';
import 'package:classtenapp/state/auth/provider/is_loggedin_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
            return const MainScreen();
          } else {
            return const RiverPodLogin();
          }
        },
      ),
    );
  }
}
