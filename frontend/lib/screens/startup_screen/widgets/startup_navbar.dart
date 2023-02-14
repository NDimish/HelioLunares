import 'package:flutter/material.dart';
import 'package:university_ticketing_system/screens/landing_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupNavbar extends StatefulWidget implements PreferredSizeWidget {
  final Function(int i) callback;
  final int selectedIndex;
  const StartupNavbar(
      {Key? key, required this.callback, required this.selectedIndex})
      : super(key: key);

  @override
  State<StartupNavbar> createState() => _StartupNavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

final sections = ["Hero", "About us", "How to use", "Testimonials", "Contact"];

class _StartupNavbarState extends State<StartupNavbar> {
  List<Widget> navbarButtons(Function(int) callback) {
    return sections
        .map(
          (i) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: sections.indexOf(i) == widget.selectedIndex
                      ? MaterialStateProperty.all(
                          Color.fromRGBO(102, 205, 170, 0.8))
                      : MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {
                print("${i} ${sections.indexOf(i)}");
                callback(sections.indexOf(i));
              },
              child: Text(
                i,
                style: GoogleFonts.barlow(
                  color: sections.indexOf(i) == widget.selectedIndex
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        elevation: 15,
        shadowColor: const Color.fromRGBO(3, 4, 94, 1),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        leading: const Icon(
          Icons.airplane_ticket_rounded,
          size: 50,
        ),
        title: Row(
          children: <Widget>[
            Text(
              "University Ticketing System",
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            ...navbarButtons(widget.callback),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LandingScreen()),
                );
              },
              child: const Text('Log in'),
            ),
          ),
        ],
      ),
    ]);
  }
}