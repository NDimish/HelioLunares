import 'package:flutter/material.dart';

/// IMPLEMENTED BY ISRAFEEL ASHRAF - K21008936
///
/// This is the gradient background of the application
///
class CustomLinearGradient extends StatefulWidget {
  Widget child;
  CustomLinearGradient({super.key, required this.child});

  @override
  State<CustomLinearGradient> createState() => _CustomLinearGradientState();
}

class _CustomLinearGradientState extends State<CustomLinearGradient> {
  List<Color> colors = [
    const Color(0xFF9796f0),
    const Color.fromARGB(255, 82, 197, 162),
    const Color.fromARGB(255, 214, 203, 81),
    const Color(0xFFE8CBC0)
  ];

  List<Alignment> alignments = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft
  ];

  int index = 0;

  Color bottomColor = const Color(0xFF9796f0); //Colors.red;
  Color topColor = const Color.fromARGB(255, 82, 197, 162); // Colors.green;

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
