import 'package:classtenapp/state/services/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(allPostProvider);
    // print("hello");
    return Scaffold(
        body: posts.when(data: (data) {
      // print(data);
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index].title),
              subtitle: Text(data[index].description),
            );
          });
    }, error: (error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      const Center(
        child: CircularProgressIndicator(),
      );
      return null;
    }));
  }
}
