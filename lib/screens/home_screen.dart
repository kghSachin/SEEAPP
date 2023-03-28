import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.purpleAccent[100],
            title: const Text('Home'),
            floating: true,
            snap: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Welcome to the app"),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("assets/images/map.jpeg", fit: BoxFit.cover),

                  Positioned(child: Text("data"), bottom: 0, left: 0),
                  Positioned(child: Text("data299"), bottom: 1, left: 1),
                  // const DecoratedBox(
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment(0, 1),
                  //       end: Alignment(0, 0),
                  //       colors: <Color>[
                  //         Color.fromARGB(95, 159, 42, 42),
                  //         Color(0x00000000),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.red,
              child: const Center(
                child: Text('Hello World'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 100,
                color: Colors.green[100],
                child: Center(
                  child: Text('Item $index'),
                ),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
