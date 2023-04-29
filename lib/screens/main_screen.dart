import 'package:classtenapp/screens/mainpages/add_post_screen.dart';
import 'package:classtenapp/screens/mainpages/home_screen.dart';
import 'package:classtenapp/screens/mainpages/notification_screen.dart';
import 'package:classtenapp/screens/mainpages/profile_screen.dart';
import 'package:classtenapp/screens/mainpages/search_screen.dart';
import 'package:classtenapp/state/ui/navbarbackend/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage3 extends ConsumerStatefulWidget {
  const HomePage3({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePage3State();
}

class _HomePage3State extends ConsumerState<HomePage3> {
  bool isSel = false;
  static final List<Widget> pages = [
    const HomeScreen(),
    const SearchPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];
  Widget currentScreen = const HomeScreen();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    var navIndex = ref.watch(navProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: pages[navIndex.index],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreatePost(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 3,
        height: 60,
        color: Colors.grey[300],
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                ref.read(navProvider.notifier).onIndexChanged(0);
              },
              icon: Icon(Icons.home,
                  size: 30,
                  color:
                      navIndex.index == 0 ? Colors.orangeAccent : Colors.grey),
            ),
            IconButton(
                onPressed: () {
                  ref.read(navProvider.notifier).onIndexChanged(1);
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color:
                      navIndex.index == 1 ? Colors.orangeAccent : Colors.grey,
                )),
            const SizedBox(width: 10),
            IconButton(
                onPressed: () {
                  ref.read(navProvider.notifier).onIndexChanged(2);
                },
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                  color:
                      navIndex.index == 2 ? Colors.orangeAccent : Colors.grey,
                )),
            IconButton(
              onPressed: () {
                ref.read(navProvider.notifier).onIndexChanged(3);
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: navIndex.index == 3 ? Colors.orangeAccent : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
