import 'package:flutter/material.dart';

class CustomLinearGradient extends StatefulWidget {
  Widget child;
  CustomLinearGradient({super.key, required this.child});

  @override
  State<CustomLinearGradient> createState() => _CustomLinearGradientState();
}

class _CustomLinearGradientState extends State<CustomLinearGradient> {
  List<Color> colors = [
    Color(0xFFE8CBC0),
    Color(0xFF636FA4),
    Color(0xFF114357),
    Color(0xFF9796f0)
  ];

  List<Alignment> alignments = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft
  ];

  int index = 0;

  Color bottomColor = const Color(0xFF9796f0); //Colors.red;
  Color topColor = const Color(0xFFE8CBC0); // Colors.green;

  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        bottomColor = const Color(0xFF636FA4); // Colors.blue;
      });
    });
  }

  Widget gradientBackground(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          onEnd: () {
            setState(() {
              index += 1;
              bottomColor = colors[index % colors.length];
              topColor = colors[(index + 1) % colors.length];

              begin = alignments[index % alignments.length];
              end = alignments[(index + 1) % alignments.length];
            });
          },
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: begin, end: end, colors: [bottomColor, topColor])),
        ),
        widget.child
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return gradientBackground(context);
  }
}
