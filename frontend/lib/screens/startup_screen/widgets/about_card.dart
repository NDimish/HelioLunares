import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCard extends StatefulWidget {
  final String devName;
  final List<String> roles;
  final String imagePath;
  final String githubLink;
  final IconData secondaryIcon;
  final String secondaryLink;

  const AboutCard(
      {Key? key,
      required this.devName,
      required this.roles,
      required this.imagePath,
      required this.githubLink,
      required this.secondaryIcon,
      required this.secondaryLink})
      : super(key: key);

  @override
  State<AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: InkWell(
          onHover: (value) => setState(() {
            isHover = value;
          }),
          onTap: () => setState(() {}),
          child: AnimatedCrossFade(
              firstChild: SizedBox(
                width: 200,
                height: 200,
                child: Card(
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(widget.imagePath),
                  ),
                ),
              ),
              secondChild: SizedBox(
                width: 200,
                height: 200,
                child: Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        Text(
                          widget.devName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                        const Divider(),
                        const Text("Project roles:",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16)),
                        const Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: Column(children: [
                            for (var role in widget.roles) Text("• $role"),
                          ]),
                        ),
                        const Spacer(),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              iconSize: 30,
                              icon: const Icon(FontAwesomeIcons.github),
                              color: Colors.black45,
                              onPressed: () async =>
                                  await launchUrl(Uri.parse(widget.githubLink)),
                            ),
                            IconButton(
                              iconSize: 30,
                              icon: Icon(widget.secondaryIcon),
                              color: Colors.black45,
                              onPressed: () async => await launchUrl(
                                  Uri.parse(widget.secondaryLink)),
                            ),
                          ],
                        ),
                        const Spacer()
                      ],
                    )),
              ),
              crossFadeState: isHover
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(seconds: 1)),
        ));
  }
}
