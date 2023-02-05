import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        height: (isHover ? 400 : 300),
        width: (isHover ? 400 : 300),
        padding: EdgeInsets.only(
            top: (isHover) ? 25 : 30.0, bottom: !(isHover) ? 25 : 30),
        child: InkWell(
            onTap: () => print("hi"),
            onHover: (value) => setState(() {
                  isHover = value;
                }),
            hoverColor: Colors.red,
            child: SizedBox(
              height: 300,
              width: 300,
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: const DecorationImage(
                            image: AssetImage("lib/assets/logo.jpg"))),
                    child: Center(
                        child: AnimatedCrossFade(
                      duration: const Duration(seconds: 1),
                      firstChild: Text(
                        "Text 1",
                        textAlign: TextAlign.start,
                      ),
                      secondChild: Text(
                        "Text 2",
                        textAlign: TextAlign.center,
                      ),
                      crossFadeState: isHover
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    )),
                  )),
            )));
  }
}
