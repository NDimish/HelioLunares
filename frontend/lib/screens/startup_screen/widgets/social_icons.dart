import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatelessWidget {
  final Icon icon;
  final String url;
  final String tooltip;
  const SocialIcon(
      {Key? key, required this.icon, required this.url, required this.tooltip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Ink(
          decoration: BoxDecoration(
            color: Color(0xFFc8b8db).withOpacity(0),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: IconButton(
            icon: icon,
            color: Color(0xFFc8b8db),
            onPressed: () async => await launchUrl(Uri.parse(url)),
            tooltip: tooltip,
          ),
        ));
  }
}
