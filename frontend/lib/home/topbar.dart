import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/sign_up/choose_sign_up_screen.dart';
import 'package:university_ticketing_system/home/homepage.dart';
import 'package:university_ticketing_system/home/homepage_screens/about_the_app/about_app.dart';
import 'package:university_ticketing_system/home/homepage_screens/contact/contact.dart';
import 'package:university_ticketing_system/home/homepage_screens/discover/discover_screen.dart';

/// DESIGNED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the custom navbar of the application, it is used for
/// the medium sized and large sized screens.
///
class TopBarContents extends StatefulWidget {
  const TopBarContents({super.key});

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List<bool> _isHovering = [false, false, false, false];

  void isHoveringUpdated(bool bIn) {
    setState(() {
      bIn ? _isHovering[0] = true : _isHovering[0] = false;
    });
  }

  List<bool> sendHoveringValues() {
    return _isHovering;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.only(right: 7),
                  child:
                      Icon(Icons.airplane_ticket_rounded, color: Colors.black)),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text(
                    'University Ticketing System',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Arvo',
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 25),
                    const DiscoverPopupMenu(),
                    SizedBox(width: screenSize.width / 50),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactScreen()),
                        );
                      },
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          fontFamily: "Arvo",
                          fontWeight: FontWeight.bold,
                          color:
                              _isHovering[1] ? Colors.deepPurple : Colors.black,
                          decorationColor: Colors.deepPurple,
                          decorationThickness: 2,
                          decoration:
                              _isHovering[1] ? TextDecoration.underline : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[2] = true : _isHovering[2] = false;
                  });
                },
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseSignUp()),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: "Arvo",
                    fontWeight: FontWeight.bold,
                    color: _isHovering[2] ? Colors.deepPurple : Colors.black,
                    decorationColor: Colors.deepPurple,
                    decorationThickness: 2,
                    decoration:
                        _isHovering[2] ? TextDecoration.underline : null,
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[3] = true : _isHovering[3] = false;
                  });
                },
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()),
                  );
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontFamily: "Arvo",
                    fontWeight: FontWeight.bold,
                    color: _isHovering[3] ? Colors.deepPurple : Colors.black,
                    decorationColor: Colors.deepPurple,
                    decorationThickness: 2,
                    decoration:
                        _isHovering[3] ? TextDecoration.underline : null,
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

enum PopupChoices { About_Us, About_The_App }

class DiscoverPopupMenu extends StatefulWidget {
  const DiscoverPopupMenu({super.key});

  @override
  State<DiscoverPopupMenu> createState() => _DiscoverPopupMenuState();
}

class _DiscoverPopupMenuState extends State<DiscoverPopupMenu> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    PopupChoices? selectedMenu;
    return PopupMenuButton<PopupChoices>(
        offset: const Offset(-40, 30),
        position: PopupMenuPosition.under,
        initialValue: selectedMenu,
        onSelected: (PopupChoices item) {
          setState(() {
            selectedMenu = item;
            if (selectedMenu == PopupChoices.About_Us) {
              setState(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DiscoverScreen()),
                );
              });
            } else {
              setState(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HowToUseSection()),
                );
              });
            }
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupChoices>>[
              const PopupMenuItem<PopupChoices>(
                value: PopupChoices.About_Us,
                child: Text(
                  'About us',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Arvo",
                    color: Colors.black,
                    decorationColor: Colors.deepPurple,
                    decorationThickness: 2,
                  ),
                ),
              ),
              const PopupMenuItem<PopupChoices>(
                value: PopupChoices.About_The_App,
                child: Text(
                  'About the app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Arvo",
                    color: Colors.black,
                    decorationColor: Colors.deepPurple,
                    decorationThickness: 2,
                  ),
                ),
              ),
            ],
        child: const Text(
          'Discover',
          style: TextStyle(
              fontFamily: "Arvo",
              color: Colors.black,
              decorationColor: Colors.deepPurple,
              decorationThickness: 2,
              fontWeight: FontWeight.bold
              //decoration: _TextDecoration.underline : null
              ),
        ));
  }
}
