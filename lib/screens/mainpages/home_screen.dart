import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/services/providers/post_provider.dart';
import '../../widgets/post_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(allPostProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              splashColor: Colors.orange,
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            IconButton(
              splashRadius: 20,
              splashColor: Colors.orange,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
          title: SizedBox(
            // height: 120,
            width: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset("assets/images/sikshyashala.png"),
            ),
          ),
        ),
        body: posts.when(
          data: (data) {
            print(data.length);
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostDisplayWidget(
                      title: data[index].title,
                      description: data[index].description);
                });
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            const Center(
              child: CircularProgressIndicator(),
            );
            return null;
          },
        ));
  }
}
