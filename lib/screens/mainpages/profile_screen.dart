import 'package:classtenapp/state/auth/backend/authenticator.dart';
import 'package:classtenapp/state/auth/provider/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    void logout() {
      ref.read(authStateProvider.notifier).logout();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "My Profile",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/map.jpeg"),
                backgroundColor: Colors.green,
                radius: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Name Surname",
                style: TextStyle(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 28,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 2,
            // ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "noname123@gmail.com",
                style: TextStyle(
                  fontFamily: GoogleFonts.abhayaLibre().fontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 2,
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.orange[200],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                style: ListTileStyle.list,
                onTap: () {},
                splashColor: Colors.orange[100],
                leading: const Icon(Icons.person),
                title: const Text("Hello World"),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                style: ListTileStyle.list,
                onTap: () {},
                splashColor: Colors.orange[100],
                leading: const Icon(Icons.person),
                title: const Text("Hello World"),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                style: ListTileStyle.list,
                onTap: () {},
                splashColor: Colors.orange[100],
                leading: const Icon(Icons.person),
                title: const Text("Hello World"),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                style: ListTileStyle.list,
                onTap: () {},
                splashColor: Colors.orange[100],
                leading: const Icon(Icons.person),
                title: const Text("Hello World"),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                style: ListTileStyle.list,
                onTap: logout,
                splashColor: Colors.orange[100],
                leading: const Icon(Icons.person),
                title: const Text("Log Out"),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
