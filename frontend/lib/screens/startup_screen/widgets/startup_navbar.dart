import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/responsiveness.dart';

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

final sections = ["About", "How to use", "Contact"];

class _StartupNavbarState extends State<StartupNavbar> {
  List<Widget> navbarButtons(Function(int) callback) {
    return sections
        .map(
          (i) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextButton(
              key: Key(i),
              style: ButtonStyle(
                  backgroundColor:
                      sections.indexOf(i) + 1 == widget.selectedIndex
                          ? MaterialStateProperty.all(const Color(0xFFc8b8db))
                          : MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {
                callback(sections.indexOf(i) + 1);
              },
              child: Text(
                i,
                style: GoogleFonts.barlow(
                  color: sections.indexOf(i) + 1 == widget.selectedIndex
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

  Widget navbarTitle(Function(int) callback) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      key: const Key("navbarTitle"),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Icon(
              Icons.airplane_ticket_rounded,
              size: 50,
            ),
          ),
          Text(
            ResponsiveWidget.isMediumScreen(context) ||
                    ResponsiveWidget.isSmallScreen(context)
                ? ""
                : "University Ticketing System",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      onTap: () => callback(0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        elevation: 15,
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFF70587c),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Row(
          children: <Widget>[
            navbarTitle(widget.callback),
            ...navbarButtons(widget.callback),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              key: const Key("loginButton"),
              onPressed: () {
                Navigator.pushNamed(context, '/auth');
              },
              child: Text(
                'Log in',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationThickness: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
