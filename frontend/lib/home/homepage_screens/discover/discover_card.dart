import 'package:flutter/material.dart';
import 'package:university_ticketing_system/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        alignment: Alignment.center,
        duration: const Duration(seconds: 1),
        child: InkWell(
          onHover: (value) => setState(() {
            isHover = value;
          }),
          onTap: () => setState(() {}),
          child: AnimatedCrossFade(
              firstChild: SizedBox(
                width: 215,
                height: 215,
                child: Card(
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(widget.imagePath),
                  ),
                ),
              ),
              secondChild: SizedBox(
                width: 215,
                height: 215,
                child: Card(
                    elevation: 0,
                    color: const Color(0xFFc8b8db).withOpacity(0.4),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(
                            widget.devName,
                            style: const TextStyle(
                                fontFamily: "Arvo",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          const Text("Project roles:",
                              style: TextStyle(
                                  fontFamily: "Arvo",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white60)),
                          Column(children: [
                            for (var role in widget.roles)
                              Text(
                                "• $role",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Arvo",
                                ),
                              ),
                          ]),
                          !ResponsiveWidget.isSmallScreen(context) &&
                                  MediaQuery.of(context).size.width <= 1000
                              ? const SizedBox(height: 0)
                              : const Divider(
                                  color: Colors.black,
                                  thickness: 0.2,
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(FontAwesomeIcons.github),
                                color: Colors.black,
                                onPressed: () async => await launchUrl(
                                    Uri.parse(widget.githubLink)),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: Icon(widget.secondaryIcon),
                                color: Colors.black,
                                onPressed: () async => await launchUrl(
                                    Uri.parse(widget.secondaryLink)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              crossFadeState: isHover
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 500)),
        ));
  }
}
