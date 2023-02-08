import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcon extends StatelessWidget {
  final Icon icon;
  const SocialIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Ink(
          decoration: const BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 15)]),
          child: IconButton(
            iconSize: 80,
            icon: icon,
            color: Colors.white,
            onPressed: () {},
          ),
        ));
  }
}
