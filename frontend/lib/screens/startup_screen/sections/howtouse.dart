import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HowToUseSection extends StatefulWidget {
  const HowToUseSection({super.key});

  @override
  State<HowToUseSection> createState() => _HowToUseSectionState();
}

class _HowToUseSectionState extends State<HowToUseSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const Text("how to use section"),
      ]),
    );
  }
}
