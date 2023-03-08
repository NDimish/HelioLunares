import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCard extends StatefulWidget {
  final String devName;
  final List<String> roles;
  final String imagePath;
  final String githubLink;
  final IconData secondaryIcon;
  final String secondaryLink;
  final double cardSize;

  const AboutCard(
      {Key? key,
      required this.devName,
      required this.roles,
      required this.imagePath,
      required this.githubLink,
      required this.secondaryIcon,
      required this.secondaryLink,
      required this.cardSize})
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
                width: widget.cardSize,
                height: widget.cardSize,
                child: Card(
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(widget.imagePath),
                  ),
                ),
              ),
              secondChild: SizedBox(
                width: widget.cardSize,
                height: widget.cardSize,
                child: Card(
                    elevation: 0,
                    color: const Color(0xFFc8b8db).withOpacity(0.7),
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
