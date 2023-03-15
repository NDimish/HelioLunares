import 'package:flutter/material.dart';
import 'package:university_ticketing_system/authentication/log_in/log_in_screen.dart';
import 'package:university_ticketing_system/authentication/sign_up/choose_sign_up_screen.dart';
import 'package:university_ticketing_system/home/homepage.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents();

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List<bool> _isHovering = [false, false, false, false];

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
                      MaterialPageRoute(builder: (context) => HomePage()),
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
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {},
                      child: Text(
                        'Discover',
                        style: TextStyle(
                            fontFamily: "Arvo",
                            fontWeight: FontWeight.bold,
                            color: _isHovering[0]
                                ? Colors.deepPurple
                                : Colors.black,
                            decorationColor: Colors.deepPurple,
                            decorationThickness: 2,
                            decoration: _isHovering[0]
                                ? TextDecoration.underline
                                : null),
                      ),
                    ),
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
                          MaterialPageRoute(builder: (context) => tw()),
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
                  'Login',
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
