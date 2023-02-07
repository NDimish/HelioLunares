import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StartupNavbar extends StatefulWidget implements PreferredSizeWidget {
  const StartupNavbar({super.key});

  @override
  State<StartupNavbar> createState() => _StartupNavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _StartupNavbarState extends State<StartupNavbar> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        elevation: 15,
        shadowColor: Colors.black,
        floating: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: const Icon(Icons.airplane_ticket_rounded),
        title: Row(
          children: <Widget>[
            Text(
              "University Ticketing System",
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                onPressed: () {},
                child: const Text('About'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                onPressed: () {},
                child: const Text('How to use'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                onPressed: () {},
                child: const Text('Contact'),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(15),
              child: const Text(
                  "login button/switch to user icon if user logged in"))
        ],
      ),
    ]);
  }
}
