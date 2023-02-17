import 'package:university_ticketing_system/log_in/widgets/log_in_form.dart';
import 'package:flutter/material.dart';

class LogInCard extends StatefulWidget {
  const LogInCard({super.key});

  @override
  State<LogInCard> createState() => _LogInCardState();
}

class _LogInCardState extends State<LogInCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.33,
            child: Card(
                elevation: 0,
                color: Colors.white.withOpacity(0.65),
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'images/university.png',
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 5),
                          const Divider(
                              color: Colors.black, indent: 100, endIndent: 100),
                          const SizedBox(height: 3),
                          const Text("Welcome back!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontFamily: 'Arvo')),
                          const SizedBox(height: 3),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                      margin:
                                          const EdgeInsets.only(right: 0.75),
                                      child: const Divider(
                                        color: Colors.black,
                                        indent: 75,
                                        endIndent: 5,
                                      )),
                                ),
                                const Text("Log into your account",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Arvo')),
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(left: 0.75),
                                      child: const Divider(
                                          color: Colors.black,
                                          indent: 5,
                                          endIndent: 75)),
                                ),
                              ]),
                          const SizedBox(height: 85),
                          LogInForm()
                        ])))));
  }
}
