import 'package:classtenapp/state/services/providers/create_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePost extends ConsumerStatefulWidget {
  const CreatePost({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatePostState();
}

class _CreatePostState extends ConsumerState<CreatePost> {
  late final TextEditingController titleController;
  late final TextEditingController postController;
  @override
  void initState() {
    super.initState();
    postController = TextEditingController();
    titleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    sendPost() async {
      var data = {
        "title": titleController.text,
        "description": postController.text
      };

      final provider = ref.watch(createPostProvider.notifier);
      bool isUploaded = await provider.makePost(data);

      if (isUploaded && mounted) {
        Navigator.of(context).pop();
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.greenAccent,
            content: Center(child: Text("Post Uploaded")),
          ),
        );
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: SizedBox(
                height: 150,
                width: 150,
                child: Center(child: Text("Post not Uploaded"))),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Create Post"),
        elevation: 0.2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: TextButton(
                onPressed: sendPost,
                child: const Text(
                  "Post",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What's the topic?",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black45,
                ),
              ),
              TextField(
                controller: titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: "Enter your Title here...",
                  hintStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "What's on your mind?",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black45,
                ),
              ),
              TextField(
                style: const TextStyle(fontSize: 26),
                controller: postController,
                maxLines: 12,
                decoration: const InputDecoration(
                  hintText: "Enter your Text here...",
                  hintStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
